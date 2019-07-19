//
//  ViewController.swift
//  Trivia
//
//  Created by Sanaa Bhorkar on 7/18/19.
//  Copyright © 2019 Sanaa Bhorkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questions = ["What has holes but can hold water?", "What has 3 feet but no toes?", "What is young when it is tall and old when it is short?", "What kind of room has no door or windows?", "What weighs more, a pound of feathers or a pound of bricks?", "What is always coming, but never arrives?", "What is black when you buy it, red when you use it, and gray when you throw it?", "This is as light as a feather, yet no man can hold it for long. What am I?"]
    
    var currentQuestion = 0
    var questionAnswers = ["a sponge", "a yardstick", "a candle", "a mushroom", "neither", "tomorrow", "charcoal", "your breath"]
    var score = 0
    var reset = false

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showAnswerSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestion]
    }
    
    func resetGame() {
        nextButton.setTitle("Check", for: .normal)
        userAnswerTextField.text = ""
        validationLabel.text = ""
        endOfGameMessageLabel.text = ""
        questionLabel.text = ""
        scoreLabel.text = "Score = 0"
        score = 0
        currentQuestion = 0
        questionLabel.text = questions[currentQuestion]
        reset = false
    }
    
    func processAnswer() {
        if reset {
            resetGame()
            return
        }
        if reset == false {
            if userAnswerTextField.text == "" {
                validationLabel.text = "Please enter an answer."
                return
            }
            let userAnswer = userAnswerTextField.text
            let correctAnswer = questionAnswers[currentQuestion]
            
            if(userAnswer!.caseInsensitiveCompare(correctAnswer) == .orderedSame) {
                validationLabel.text = "Correct! Great job."
                score += 1
            } else {
                if showAnswerSwitch.isOn {
                    validationLabel.text = "Incorrect. The correct answer actually is \(correctAnswer)."
                } else {
                    validationLabel.text = "Incorrect."
                }
            }
            currentQuestion += 1
            if currentQuestion >= questions.count {
                if score > questions.count / 2 {
                    endOfGameMessageLabel.text = "Well done. Great game! Your score was \(String(score)) out of \(questions.count)!"
                } else {
                    endOfGameMessageLabel.text = "Better luck next time. Your score was \(String(score)) out of \(questions.count)."
                }
                nextButton.setTitle("Restart", for: .normal)
                reset = true
            } else {
                questionLabel.text = questions[currentQuestion]
            }
            userAnswerTextField.text = ""
            scoreLabel.text = "Score: \(String(score))"
            
        }
    }

    @IBAction func textFieldEnterPress(_ sender: Any) {
        processAnswer()
    }
    @IBAction func checkButtonClick(_ sender: Any) {
        processAnswer()
    }
}
