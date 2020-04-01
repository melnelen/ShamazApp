//
//  SecondViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 31/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nextPlayerButton: UIButton!
    @IBOutlet weak var playerTaskLabel: UILabel!
    
    var receivedPhrase = "Player's task"
    var nextPlayerPhrase = ""
    var nextPlayerNumber = Int.random(in: 1...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextPlayerButton.layer.cornerRadius = Design.buttonRadius
        nextPlayerButton.backgroundColor = .white
        nextPlayerButton.setTitleColor(Design.primaryThemeColor, for: [])
        nextPlayerButton.setTitle("Who's NeXT?", for: [])
        
        playerTaskLabel.textColor = Design.textColor
        playerTaskLabel.font = Design.labelFont
        playerTaskLabel.text = receivedPhrase
    }
    
    @IBAction func generateNextPlayer(_ sender: Any) {
        nextPlayerPhrase = "Ready, Player " + String(nextPlayerNumber) + "?"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //modify the label for the next player
        let newVC: ViewController = segue.destination as! ViewController
        newVC.receivedPhrase = nextPlayerPhrase
    }
}
