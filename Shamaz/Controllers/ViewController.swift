//
//  ViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 22/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var futureButton: UIButton!
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var nextPlayer: UILabel!
    
    var playersTaskPhrase = ""
    var receivedPhrase = "Ready, Player 1?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        futureButton.layer.cornerRadius = Design.buttonRadius
        futureButton.backgroundColor = Design.firstChoiceColor
        futureButton.setTitleColor(Design.primaryThemeColor, for: [])
        futureButton.setTitle("DREAM of the future", for: [])
        
        pastButton.layer.cornerRadius = Design.buttonRadius
        pastButton.backgroundColor = Design.secondChoiceColor
        pastButton.setTitleColor(Design.primaryThemeColor, for: [])
        pastButton.setTitle("REFLECT on the past", for: [])
        
        nextPlayer.textColor = Design.textColor
        nextPlayer.font = Design.labelFont
        nextPlayer.text = receivedPhrase
    }
    
    @IBAction func genereteFutureStorytellingTask(_ sender: Any) {
        //generate random future story start phrase
        let randomFutureStoryStartPhraseIndex = Int.random(in: 0..<Phrases.futureStoryStartPhrases.count)
        let randomFutureStoryStartPhrase = Phrases.futureStoryStartPhrases[randomFutureStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0..<Phrases.timeIndicators.count)
        var randomTimeIndicator = Phrases.timeIndicators[randomTimeIndicatorIndex]
        
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
            randomTimeIndicator = Phrases.timeIndicators[randomTimeIndicatorIndex]
            newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + " " + Phrases.futureStoryEndPhrase + "?"
        }
        
        //save new created phrase
        playersTaskPhrase = newFutureStorytellingTask
    }
    
    @IBAction func generetePastStorytellingTask(_ sender: Any) {
        //generate random past story start phrase
        let randomPastStoryStartPhraseIndex = Int.random(in: 0..<Phrases.pastStoryStartPhrases.count)
        let randomPastStoryStartPhrase = Phrases.pastStoryStartPhrases[randomPastStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0..<Phrases.timeIndicators.count)
        var randomTimeIndicator = Phrases.timeIndicators[randomTimeIndicatorIndex]
        
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
            randomTimeIndicator = Phrases.timeIndicators[randomTimeIndicatorIndex]
            newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + " " + Phrases.pastStoryEndPhrase + "?"
        }
        
        //save new created phrase
        playersTaskPhrase = newPastStorytellingTask
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //modify the label for the player's task
        let newVC: SecondViewController = segue.destination as! SecondViewController
        newVC.receivedPhrase = playersTaskPhrase
    }
}
