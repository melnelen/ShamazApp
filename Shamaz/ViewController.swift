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
    @IBOutlet weak var storytellingTask: UILabel!
    
    let appTextColor = UIColor(white: 1.00, alpha: 1.00)
    let appLabelFont = UIFont(name: "Chalkduster", size: 30.0)
    let appButtonFont = UIFont(name: "Chalkduster", size: 20.0)
    let appButtonRadius:CGFloat = 5.00
    let appLightGreenColor = CGColor(srgbRed: 0.25, green: 0.80, blue: 0.60, alpha: 1.00)
    let appLightBlueColor = CGColor(srgbRed: 0.13, green: 0.77, blue: 0.80, alpha: 1.00)
    
    let Phrase = Phrases()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        futureButton.layer.cornerRadius = appButtonRadius
        futureButton.layer.backgroundColor = appLightGreenColor
        
        pastButton.layer.cornerRadius = appButtonRadius
        pastButton.layer.backgroundColor = appLightBlueColor
        
        storytellingTask.textColor = appTextColor
        storytellingTask.font = appLabelFont
    }
    
    @IBAction func genereteFutureStorytellingTask(_ sender: Any) {
        //generate random future story start phrase
        let randomFutureStoryStartPhraseIndex = Int.random(in: 0...Phrase.futureStoryStartPhrases.count)
        let randomFutureStoryStartPhrase = Phrase.futureStoryStartPhrases[randomFutureStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0...Phrase.timeIndicators.count)
        let randomTimeIndicator = Phrase.timeIndicators[randomTimeIndicatorIndex]
        
        //modify the label
        let newFutureStorytellingTask = randomFutureStoryStartPhrase + " " + randomTimeIndicator + " " + Phrase.futureStoryEndPhrase + "?"
        storytellingTask.text = newFutureStorytellingTask
    }
    
    @IBAction func generetePastStorytellingTask(_ sender: Any) {
        //generate random past story start phrase
        let randomPastStoryStartPhraseIndex = Int.random(in: 0...Phrase.pastStoryStartPhrases.count)
        let randomPastStoryStartPhrase = Phrase.pastStoryStartPhrases[randomPastStoryStartPhraseIndex]
        
        //generate random time indicator
        let randomTimeIndicatorIndex = Int.random(in: 0...Phrase.timeIndicators.count)
        let randomTimeIndicator = Phrase.timeIndicators[randomTimeIndicatorIndex]
        
        //modify the label
        let newPastStorytellingTask = randomPastStoryStartPhrase + " " + randomTimeIndicator + " " + Phrase.pastStoryEndPhrase + "?"
        storytellingTask.text = newPastStorytellingTask
    }
    
    
}

