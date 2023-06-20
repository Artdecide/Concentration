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
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 1)
        }
    }

    var emojiCollection = ["🍏", "🍎", "🍏", "🍎"]
    
    
    
    
    
    
    
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
        }
    }
    @IBOutlet weak var touchLabel: UILabel!
}

