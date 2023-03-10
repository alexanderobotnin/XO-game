//
//  GameViewController.swift
//  XO-game
//
// Created by Alexander Obotnin on 20.12.2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!

	private let gameboard = Gameboard()
	private var currentState: GameState! {
		didSet {
			self.currentState.begin()
		}
	}
	private lazy var referee = Referee(gameboard: self.gameboard)
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.goToFirstState()
		gameboardView.onSelectPosition = { [weak self] position in
			guard let self = self else { return }
			self.currentState.addMark(at: position)
			if self.currentState.isCompleted {
				self.goToNextState()
			}
		}
    }

	private func goToFirstState() {
		let player = Player.first
		self.currentState = PlayerInputState(player: player,
											 markViewPrototype: player.markViewPrototype,
											 gameViewController: self,
											 gameboard: gameboard,
											 gameboardView: gameboardView)
	}

	private func goToNextState() {

		if let winner = self.referee.determineWinner() {
			self.currentState = GameEndedState(winner: winner, gameViewController: self)
			return
		}

		if let playerInputState = currentState as? PlayerInputState {
			let player = playerInputState.player.next
			self.currentState = PlayerInputState(player: player,
												 markViewPrototype: player.markViewPrototype,
												 gameViewController: self,
												 gameboard: gameboard,
												 gameboardView: gameboardView)
		}
	}
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
		gameboard.clear()
		gameboardView.clear()
		goToFirstState()
		Log(.restartGame)
    }
}

