//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Александр Кулаков on 20.06.2023.
//

import Foundation


class ConcentrationGame {
    var cards = [Card]()
    var indexOfOneOnlyFaceUpCard: Int?
    
    //Алгоритм как должна играть игра
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneOnlyFaceUpCard = index 
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
