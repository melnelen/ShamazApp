//
//  ViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 22/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    @IBOutlet weak var futureButton: UIButton!
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var nextPlayer: UILabel!
    
    let appTextColor = UIColor(white: 1.00, alpha: 1.00)
    let appLabelFont = UIFont(name: "Chalkduster", size: 30.0)
    let appButtonFont = UIFont(name: "Chalkduster", size: 20.0)
    let appButtonRadius:CGFloat = 5.00
    let appLightGreenColor = CGColor(srgbRed: 0.25, green: 0.80, blue: 0.60, alpha: 1.00)
    let appLightBlueColor = CGColor(srgbRed: 0.13, green: 0.77, blue: 0.80, alpha: 1.00)
    
    let Phrase = Phrases()
    
    var playersTaskPhrase = ""
    var recievedPhrase = "Ready, Player 1?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        futureButton.layer.cornerRadius = appButtonRadius
        futureButton.layer.backgroundColor = appLightGreenColor
        futureButton.setTitle("DREAM of the future", for: [])
        
        pastButton.layer.cornerRadius = appButtonRadius
        pastButton.layer.backgroundColor = appLightBlueColor
        pastButton.setTitle("REFLECT on the past", for: [])
        
        nextPlayer.textColor = appTextColor
        nextPlayer.font = appLabelFont
        nextPlayer.text = recievedPhrase
    }
    
    @IBAction func genereteFutureStorytellingTask(_ sender: Any) {
        //generate random future story start phrase
        let randomFutureStoryStartPhraseIndex = Int.random(in: 0..<Phrase.futureStoryStartPhrases.count)
        let randomFutureStoryStartPhrase = Phrase.futureStoryStartPhrases[randomFutureStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0..<Phrase.timeIndicators.count)
        var randomTimeIndicator = Phrase.timeIndicators[randomTimeIndicatorIndex]
        
        //create the new future storytelling task pharase
        var newFutureStorytellingTask = "?"
        switch randomTimeIndicator {
        case "1 day":
            randomTimeIndicator = "tomorrow"
            newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + "?"
        case "1 week":
            randomTimeIndicator = "next week"
            newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + "?"
        case "1 month":
            randomTimeIndicator = "next month"
            newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + "?"
        case "1 year":
            randomTimeIndicator = "next year"
            newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + "?"
        default:
            randomTimeIndicator = Phrase.timeIndicators[randomTimeIndicatorIndex]
            newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + " " + Phrase.futureStoryEndPhrase + "?"
        }
        
        //save new created phrase
        playersTaskPhrase = newFutureStorytellingTask
    }
    
    @IBAction func generetePastStorytellingTask(_ sender: Any) {
        //generate random past story start phrase
        let randomPastStoryStartPhraseIndex = Int.random(in: 0..<Phrase.pastStoryStartPhrases.count)
        let randomPastStoryStartPhrase = Phrase.pastStoryStartPhrases[randomPastStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0..<Phrase.timeIndicators.count)
        var randomTimeIndicator = Phrase.timeIndicators[randomTimeIndicatorIndex]
        
        //create the new future storytelling task pharase
        var newPastStorytellingTask = "?"
        switch randomTimeIndicator {
        case "1 day":
            randomTimeIndicator = "yesterday"
            newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + "?"
        case "1 week":
            randomTimeIndicator = "last week"
            newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + "?"
        case "1 month":
            randomTimeIndicator = "last month"
            newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + "?"
        case "1 year":
            randomTimeIndicator = "last year"
            newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + "?"
        default:
            randomTimeIndicator = Phrase.timeIndicators[randomTimeIndicatorIndex]
            newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + " " + Phrase.pastStoryEndPhrase + "?"
        }
        
        //save new created phrase
        playersTaskPhrase = newPastStorytellingTask
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //modify the label for the player's task
        let newVC: SecondViewController = segue.destination as! SecondViewController
        newVC.recievedPhrase = playersTaskPhrase
    }
    
}

