//
//  Player.swift
//  XO-game
//
// Created by Alexander Obotnin on 20.12.2022.
//

import Foundation

public enum Player: CaseIterable {
    case first
    case second
    
    var next: Player {
        switch self {
        case .first: return .second
        case .second: return .first
        }
    }

	var markViewPrototype: MarkView {
		switch self {
		case .first: return XView()
		case .second: return OView()
		}
	}
}
