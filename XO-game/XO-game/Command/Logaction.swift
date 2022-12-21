//
//  Logaction.swift
//  XO-game
//
// Created by Alexander Obotnin on 20.12.2022.
//

enum LogAction {

	case playerInput(player: Player, position: GameboardPosition)

	case gameFinished(winner: Player?)

	case restartGame
}
