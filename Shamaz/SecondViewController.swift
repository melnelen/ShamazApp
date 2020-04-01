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
    
    let appTextColor = UIColor(white: 1.00, alpha: 1.00)
    let appLabelFont = UIFont(name: "Chalkduster", size: 30.0)
    let appButtonFont = UIFont(name: "Chalkduster", size: 20.0)
    let appButtonRadius:CGFloat = 5.00
    let appLightGreenColor = CGColor(srgbRed: 0.25, green: 0.80, blue: 0.60, alpha: 1.00)
    let appLightBlueColor = CGColor(srgbRed: 0.13, green: 0.77, blue: 0.80, alpha: 1.00)
    
    var recievedPhrase = "Player's task"
    var nextPlayerPhrase = ""
    var nextPlayerNumber = Int.random(in: 1...10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextPlayerButton.layer.cornerRadius = appButtonRadius
        nextPlayerButton.layer.backgroundColor = appLightBlueColor
        nextPlayerButton.setTitle("Who's NeXT?", for: [])
        
        playerTaskLabel.textColor = appTextColor
        playerTaskLabel.font = appLabelFont
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
