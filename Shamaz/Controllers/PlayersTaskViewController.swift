//
//  SecondViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 31/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

class PlayersTaskViewController: UIViewController {

    @IBOutlet weak var nextPlayerButton: UIButton!
    @IBOutlet weak var playerTaskLabel: UILabel!
    
    var receivedPhrase = ""
    var gameStart: GameStartViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextPlayerButton.layer.cornerRadius = Design.buttonRadius
        nextPlayerButton.backgroundColor = .white
        nextPlayerButton.setTitleColor(Design.primaryThemeColor, for: [])
        nextPlayerButton.setTitle("\(Phrases.nextButton)", for: [])
        
        playerTaskLabel.textColor = Design.textColor
        playerTaskLabel.font = Design.labelFont
        playerTaskLabel.text = receivedPhrase
    }
    
    @IBAction func generateNextPlayer(_ sender: Any) {
        gameStart.nextPlayer.text = "\(Phrases.nextPlayer) \(Int.random(in: 1...10))?"
        dismiss(animated: true)
    }
}
