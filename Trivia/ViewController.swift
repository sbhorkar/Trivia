//
//  ViewController.swift
//  Trivia
//
//  Created by Sanaa Bhorkar on 7/18/19.
//  Copyright © 2019 Sanaa Bhorkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questions = ["What has holes but can hold water?", "What has 3 feet but no toes?", "What is young when it is tall and old when it is short?"]
    var questionAnswers = ["A sponge", "A yardstick", "A candle"]
    var currentQuestion = 0

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = questions[currentQuestion]
    }


}

