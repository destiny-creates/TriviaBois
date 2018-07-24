//
//  ViewController.swift
//  triviaBois
//
//  Created by Chris Cook on 7/20/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var currentQuestion: TriviaQuestion! {
        didSet {
            questionLabel.text = currentQuestion.question
            answer1Button.setTitle(currentQuestion.answers[0], for: .normal)
            answer2Button.setTitle(currentQuestion.answers[1], for: .normal)
            answer3Button.setTitle(currentQuestion.answers[2], for: .normal)
            answer4Button.setTitle(currentQuestion.answers[3], for: .normal)
            print("the correct answer is: \(currentQuestion.correctAnswer)")
            
        }
    }
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newQuestion = TriviaQuestion(question: "Who is the president of the usa in 2018?", answers: ["trump","lil pump","the rock","obama"], correctAnswerIndex: 0)
        // Do any additional setup after loading the view, typically from a nib.
    currentQuestion = newQuestion
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        print(sender.tag)
    }
    

}

