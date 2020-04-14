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
    var nextPlayerPhrase = ""
    private var nextPlayerNumber = Int.random(in: 1...10)
    
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
        nextPlayerPhrase = "\(Phrases.nextPlayer) \(nextPlayerNumber)?"
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //modify the label for the next player
        let newVC: GameStartViewController = segue.destination as! GameStartViewController
        newVC.receivedPhrase = nextPlayerPhrase
    }
}
