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
    
   

    var emojiCollection = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍓", "🍈", "🥥", "🍅", "🫐", "🍑", "🥝"]
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomEmoji = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomEmoji)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
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

