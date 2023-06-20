//
//  Card.swift
//  Concentration
//
//  Created by Александр Кулаков on 20.06.2023.
//

import Foundation


struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    static func identifierGeneration() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGeneration()
    }
}
