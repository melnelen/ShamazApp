//
//  ViewController.swift
//  Shamaz
//
//  Created by Alexandra Ivanova on 22/03/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let test1 = "hello"
    
    let test2 = "world"
    
    
    
    @IBOutlet weak var storytellingTask: UILabel!
    
    @IBAction func genereteFutureStorytellingTask(_ sender: Any) {
        //modify the label
        let newStorytellingTask = test1
        storytellingTask.text = newStorytellingTask
    }
    
    @IBAction func generetePastStorytellingTask(_ sender: Any) {
        //modify the label
        let newStorytellingTask = test2
        storytellingTask.text = newStorytellingTask
    }
    
    
}

