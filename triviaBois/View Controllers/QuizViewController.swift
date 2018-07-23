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
    
    override func viewDidLoad() {
        super.viewDidLoad()
  let newQuestion = TriviaQuestion(question: "Who is the president of the usa in 2018?", answers: ["trump","lil pump","the rock","obama"], correctAnswerIndex: 0)
        
        questionLabel.text = newQuestion.question
        answer1Button.setTitle(newQuestion.answers[0], for: .normal)
        answer2Button.setTitle(newQuestion.answers[1], for: .normal)
        answer3Button.setTitle(newQuestion.answers[2], for: .normal)
        answer4Button.setTitle(newQuestion.answers[3], for: .normal)
        print("the correct answer is: \(newQuestion.correctAnswer)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

