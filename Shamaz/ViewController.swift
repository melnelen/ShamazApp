//
//  ViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 22/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let futureStoryStartPhrases = ["What would you like to be doing", "What would you like to have for dinner", "Where would you like to be", "Who would you like to meet", "Who would you like to be with"]
    
    let pastStoryStartPhrases = ["What did you do", "Where were you", "What did you have for breakfast", "What did you have for dinner", "What did you wear", "Who did you talk to", "Who did you meet"]
    
    let timeIndicators = ["1 day", "2 days", "3 days", "4 days", "5 days", "1 week", "3 weeks", "1 month", "3 months", "6 months", "1 year", "5 years", "10 years"]
    
    let futureStoryEndPhrase = "from now"
    
    let pastStoryEndPhrase = "ago"
    
    @IBOutlet weak var storytellingTask: UILabel!
    
    @IBAction func genereteFutureStorytellingTask(_ sender: Any) {
        //generate random future story start phrase
        let randomFutureStoryStartPhraseIndex = Int(arc4random_uniform(UInt32(futureStoryStartPhrases.count)))
        let randomFutureStoryStartPhrase = futureStoryStartPhrases[randomFutureStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int(arc4random_uniform(UInt32(timeIndicators.count)))
        let randomTimeIndicator = timeIndicators[randomTimeIndicatorIndex]
        
        //modify the label
        let newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + " " + futureStoryEndPhrase + "?"
        storytellingTask.text = newFutureStorytellingTask
    }
    
    @IBAction func generetePastStorytellingTask(_ sender: Any) {
        //generate random past story start phrase
        let randomPastStoryStartPhraseIndex = Int(arc4random_uniform(UInt32(pastStoryStartPhrases.count)))
        let randomPastStoryStartPhrase = pastStoryStartPhrases[randomPastStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int(arc4random_uniform(UInt32(timeIndicators.count)))
        let randomTimeIndicator = timeIndicators[randomTimeIndicatorIndex]
        
        //modify the label
        let newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + " " + pastStoryEndPhrase + "?"
        storytellingTask.text = newPastStorytellingTask
    }
    
    
}

