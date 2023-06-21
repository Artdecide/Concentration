//
//  ViewController.swift
//  Concentration
//
//  Created by Александр Кулаков on 20.06.2023.
//

import UIKit

class ViewController: UIViewController {
    //создаем отношение контроллера и модели через класс ConcentrationGame
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    
    
    var touches = 0 {
        didSet {
            touchLabel.text = "Flip: \(touches)"
        }
    }
    
   

    var emojiCollection = ["🍏", "🍎", "🍏", "🍎"]
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji, for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            }
        }
    }
    
    
    
    
    
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    @IBOutlet weak var touchLabel: UILabel!
}

