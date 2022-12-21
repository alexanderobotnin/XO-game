//
//  Copying.swift
//  XO-game
//
// Created by Alexander Obotnin on 20.12.2022.
//

protocol Copying {
	init(_ prototype: Self)
}

extension Copying {
	func copy() -> Self {
		return type(of: self).init(self)
	}
}
