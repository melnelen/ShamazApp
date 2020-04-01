//
//  SecondViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 31/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SecondViewController: UIViewController {

    @IBOutlet weak var nextPlayerButton: UIButton!
    @IBOutlet weak var playerTaskLabel: UILabel!
    
    var recievedPhrase = "Player's task"
    var nextPlayerPhrase = ""
    var nextPlayerNumber = Int.random(in: 1...10)
    
    let design = Design()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextPlayerButton.layer.cornerRadius = design.buttonRadius
        nextPlayerButton.backgroundColor = .white
        nextPlayerButton.setTitleColor(design.midnightBlue, for: [])
        nextPlayerButton.setTitle("Who's NeXT?", for: [])
        
        playerTaskLabel.textColor = design.textColor
        playerTaskLabel.font = design.labelFont
        playerTaskLabel.text = recievedPhrase
    }
    
    @IBAction func generateNextPlayer(_ sender: Any) {
        nextPlayerPhrase = "Ready, Player " + String(nextPlayerNumber) + "?"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //modify the label for the next player
        let newVC: ViewController = segue.destination as! ViewController
        newVC.recievedPhrase = nextPlayerPhrase
    }
}
