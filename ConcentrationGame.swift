//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Александр Кулаков on 20.06.2023.
//

import Foundation


class ConcentrationGame {
    var cards = [Card]()
    
    //Алгоритм как должна играть игра
    func chooseCard(at index: Int) {
        
    }
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
