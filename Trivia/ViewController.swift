//
//  ViewController.swift
//  Trivia
//
//  Created by Sanaa Bhorkar on 7/18/19.
//  Copyright © 2019 Sanaa Bhorkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questions = ["What has holes but can hold water?", "What has 3 feet but no toes?", "What is young when it is tall and old when it is short?", "What kind of room has no door or windows?", "What weighs more, a pound of feathers or a pound of bricks?", "What is always coming, but never arrives?"]
    var currentQuestion = 0
    var questionAnswers = ["a sponge", "a yardstick", "a candle", "a mushroom", "neither, they both weigh the same", "tomorrow"]
    var score = 0

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestion]
    }

    @IBAction func checkButtonClick(_ sender: Any) {
        if userAnswerTextField.text == "" {
            validationLabel.text = "Please enter an answer"
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = questionAnswers[currentQuestion]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer) == .orderedSame) {
            validationLabel.text = "Correct! Great job."
            score += 1
        } else {
            validationLabel.text = "Incorrect. The correct answer actually is \(correctAnswer)."
        }
        currentQuestion += 1
        if currentQuestion >= questions.count {
            if score > questions.count / 2 {
                userAnswerTextField.text = "GAME OVER"
                endOfGameMessageLabel.text = "Well done. Great game! Your score was \(String(score))!"
            } else {
                userAnswerTextField.text = "GAME OVER"
                endOfGameMessageLabel.text = "Better luck next time. Your score was \(String(score))."
            }
            
        } else {
            questionLabel.text = questions[currentQuestion]
        }
        userAnswerTextField.text = ""
        scoreLabel.text = "Score: \(String(score))"
        
    }
}
