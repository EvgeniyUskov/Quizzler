//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    let questionBank = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) /\(questionBank.list.count)"
        progressBar.frame.size.width = (CGFloat(view.frame.size.width) / CGFloat(questionBank.list.count))   *  CGFloat(questionNumber + 1)
    }
    
    func nextQuestion() {
        if questionNumber < questionBank.list.count {
            questionLabel.text = questionBank.list[questionNumber].questionString
        }
        else {
            alert()
        }
    }
    
    func checkAnswer() {
        if pickedAnswer ==  questionBank.list[questionNumber ].answer {
            ProgressHUD.showSuccess("Corect")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong")
        }
        updateUI()
    }
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
        score = 0
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "0/ \(questionBank.list.count)"
    }
    
    func alert() {
        let alert = UIAlertController(title: "That's all!", message: "You riched the end of the game! Do you want to start over?", preferredStyle: UIAlertController.Style.alert  )
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.startOver()
        }

        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil )
    }
    
}
