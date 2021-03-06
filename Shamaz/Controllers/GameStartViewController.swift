//
//  ViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 22/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

class GameStartViewController: UIViewController {
    
    @IBOutlet weak var futureButton: UIButton!
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var nextPlayer: UILabel!
    
    private var playersTaskPhrase = ""
    
    //change the status bar color to light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        futureButton.layer.cornerRadius = Design.buttonRadius
        futureButton.backgroundColor = Design.firstChoiceColor
        futureButton.setTitleColor(Design.primaryThemeColor, for: [])
        futureButton.setTitle("\(Phrases.futureButton)", for: [])
        
        pastButton.layer.cornerRadius = Design.buttonRadius
        pastButton.backgroundColor = Design.secondChoiceColor
        pastButton.setTitleColor(Design.primaryThemeColor, for: [])
        pastButton.setTitle("\(Phrases.pastButton)", for: [])
        
        nextPlayer.textColor = Design.textColor
        nextPlayer.font = Design.labelFont
        nextPlayer.text = "\(Phrases.nextPlayer) 1?"
    }
    
    @IBAction func generateFutureStorytellingTask(_ sender: Any) {
        let randomFutureStoryStartPhrase = generateRandom(storyStartPhrase: Phrases.futureStoryStartPhrases)
        let randomTimeIndicator = generateRandomTimeIndicator()
        
        //create the new future storytelling task phrase
        var newFutureStorytellingTask = "\(randomFutureStoryStartPhrase) "
        switch randomTimeIndicator {
        case Phrases.oneDay:
            newFutureStorytellingTask += improvePhrase(with: Phrases.oneDayInTheFuture)
        case Phrases.oneWeek:
            newFutureStorytellingTask += improvePhrase(with: Phrases.oneWeekInTheFuture)
        case Phrases.oneMonth:
            newFutureStorytellingTask += improvePhrase(with: Phrases.oneMonthInTheFuture)
        case Phrases.oneYear:
            newFutureStorytellingTask += improvePhrase(with: Phrases.oneYearInTheFuture)
        default:
            newFutureStorytellingTask += "\(randomTimeIndicator) \(Phrases.futureStoryEndPhrase)?"
        }
        
        //save new created phrase
        playersTaskPhrase = newFutureStorytellingTask
    }
    
    @IBAction func generatePastStorytellingTask(_ sender: Any) {
        let randomPastStoryStartPhrase = generateRandom(storyStartPhrase: Phrases.pastStoryStartPhrases)
        let randomTimeIndicator = generateRandomTimeIndicator()
        
        //create the new future storytelling task phrase
        var newPastStorytellingTask = "\(randomPastStoryStartPhrase) "
        switch randomTimeIndicator {
        case Phrases.oneDay:
            newPastStorytellingTask += improvePhrase(with: Phrases.oneDayInThePast)
        case Phrases.oneWeek:
            newPastStorytellingTask += improvePhrase(with: Phrases.oneWeekInThePast)
        case Phrases.oneMonth:
            newPastStorytellingTask += improvePhrase(with: Phrases.oneMonthInThePast)
        case Phrases.oneYear:
            newPastStorytellingTask += improvePhrase(with: Phrases.oneYearInThePast)
        default:
            newPastStorytellingTask += "\(randomTimeIndicator) \(Phrases.pastStoryEndPhrase)?"
        }
        
        //save new created phrase
        playersTaskPhrase = newPastStorytellingTask
    }
    
    //add a time indicator to a phrase
    private func improvePhrase(with timeIndicator: String) -> String {
        return "\(timeIndicator)?"
    }
    
    //generate random time indicator
    private func generateRandomTimeIndicator() -> String {
        let randomTimeIndicatorIndex = Int.random(in: 0..<Phrases.timeIndicators.count)
        return Phrases.timeIndicators[randomTimeIndicatorIndex]
    }
    
    //generate random story start phrase
    private func generateRandom(storyStartPhrase storyStartPhrases: [String]) -> String {
        let randomPastStoryStartPhraseIndex = Int.random(in: 0..<storyStartPhrases.count)
        return storyStartPhrases[randomPastStoryStartPhraseIndex]
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //modify the label for the player's task
        let newVC: PlayersTaskViewController = segue.destination as! PlayersTaskViewController
        newVC.receivedPhrase = playersTaskPhrase
        newVC.gameStart = self
    }
}
