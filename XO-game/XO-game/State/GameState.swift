//
//  GameState.swift
//  XO-game
//
// Created by Alexander Obotnin on 20.12.2022.
//

public protocol GameState {

	var isCompleted: Bool { get }

	func begin()

	func addMark(at position: GameboardPosition)
}
