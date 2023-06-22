//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Александр Кулаков on 22.06.2023.
//

import Foundation



class ConcentrationGame {
    var cards = [Card]()
    
    func choosedCard(at index: Int) {
        
    }
    
    init(numberOfParisOfCard: Int){
        let card = Card()
        for _ in 1...numberOfParisOfCard {
            cards += [card, card]
        }
    }
}
