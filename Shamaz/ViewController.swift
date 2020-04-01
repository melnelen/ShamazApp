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
    
    let design = Design()
    let phrases = Phrases()
    
    var playersTaskPhrase = ""
    var recievedPhrase = "Ready, Player 1?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        futureButton.layer.cornerRadius = design.buttonRadius
        futureButton.backgroundColor = design.lightGreenColor
        futureButton.setTitleColor(design.midnightBlue, for: [])
        futureButton.setTitle("DREAM of the future", for: [])
        
        pastButton.layer.cornerRadius = design.buttonRadius
        pastButton.backgroundColor = design.lightBlueColor
        pastButton.setTitleColor(design.midnightBlue, for: [])
        pastButton.setTitle("REFLECT on the past", for: [])
        
        nextPlayer.textColor = design.textColor
        nextPlayer.font = design.labelFont
        nextPlayer.text = recievedPhrase
    }
    
    @IBAction func genereteFutureStorytellingTask(_ sender: Any) {
        //generate random future story start phrase
        let randomFutureStoryStartPhraseIndex = Int.random(in: 0..<phrases.futureStoryStartPhrases.count)
        let randomFutureStoryStartPhrase = phrases.futureStoryStartPhrases[randomFutureStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0..<phrases.timeIndicators.count)
        var randomTimeIndicator = phrases.timeIndicators[randomTimeIndicatorIndex]
        
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
            randomTimeIndicator = phrases.timeIndicators[randomTimeIndicatorIndex]
            newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + " " + phrases.futureStoryEndPhrase + "?"
        }
        
        //save new created phrase
        playersTaskPhrase = newFutureStorytellingTask
    }
    
    @IBAction func generetePastStorytellingTask(_ sender: Any) {
        //generate random past story start phrase
        let randomPastStoryStartPhraseIndex = Int.random(in: 0..<phrases.pastStoryStartPhrases.count)
        let randomPastStoryStartPhrase = phrases.pastStoryStartPhrases[randomPastStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0..<phrases.timeIndicators.count)
        var randomTimeIndicator = phrases.timeIndicators[randomTimeIndicatorIndex]
        
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
            randomTimeIndicator = phrases.timeIndicators[randomTimeIndicatorIndex]
            newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + " " + phrases.pastStoryEndPhrase + "?"
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
