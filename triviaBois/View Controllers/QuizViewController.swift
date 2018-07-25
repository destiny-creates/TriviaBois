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
    
    private var currentQuestion: TriviaQuestion! {
        didSet {
            questionLabel.text = currentQuestion.question
            answer1Button.setTitle(currentQuestion.answers[0], for: .normal)
            answer2Button.setTitle(currentQuestion.answers[1], for: .normal)
            answer3Button.setTitle(currentQuestion.answers[2], for: .normal)
            answer4Button.setTitle(currentQuestion.answers[3], for: .normal)
            print("the correct answer is: \(currentQuestion.correctAnswer)")
            
        }
    }
    var questions: [TriviaQuestion] = []
    var questionsPlaceholder: [TriviaQuestion] = []
    var currentIndex: Int!
    
    private var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newQuestion = TriviaQuestion(question: "Who is the president of the usa in 2018?", answers: ["trump","lil pump","the rock","obama"], correctAnswerIndex: 0)
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestion = newQuestion
        popularQuestionArray()
        gotNewQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func popularQuestionArray() {
        let question1 = TriviaQuestion(question: "Who is the president of the usa in 2018?", answers: ["trump","lil pump","the rock","obama"], correctAnswerIndex: 0)
        questions.append(question1)
        let question2 = TriviaQuestion(question: "who is better? ul,or uk", answers: ["uk", "ul","idk","dont care"], correctAnswerIndex: 0)
        questions.append(question2)
        let question3 = TriviaQuestion(question: "how old is jamie fox?", answers: ["older than me lol", "70", "50", "100"], correctAnswerIndex: 2)
        questions.append(question3)
    }
    func gotNewQuestion() {
        if questions.count > 0 {
            currentIndex = Int(arc4random_uniform(UInt32(questions.count)))
            currentQuestion = questions[currentIndex]
        } else {
            showGameOverAlert()
        }
    }
    func resetGame() {
        score = 0
        if questions.count != 0 {
            questionsPlaceholder.append(contentsOf: questions)
            questions.removeAll()
        }
        questions = questionsPlaceholder
        questionsPlaceholder.removeAll()
        gotNewQuestion()
    }
    
    func showCorrectAnswerAlert() {
        let alertController = UIAlertController(title: "correct!", message: "\(currentQuestion.correctAnswer) is the correct answer. Good job!", preferredStyle: .alert)
        let alerAction = UIAlertAction(title: "thank you!", style: .default) { (action) in
            print("The alert action button was tapped")
            self.questionsPlaceholder.append(self.questions[self.currentIndex])
            self.questions.remove(at: self.currentIndex)
            self.gotNewQuestion()
        }
        alertController.addAction(alerAction)
        self.present(alertController, animated: true,completion: nil)
    }
    func showGameOverAlert() {
        let alertController = UIAlertController(title: "Game over!", message: "Your score was \(score).", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Reset", style: .default) { action in self.resetGame()
            
        }
        alertController.addAction(resetAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func showIncorrectAnswerAlert() {
        let alertController1 = UIAlertController(title: "incorrect!", message: "you got it wrong.try again!", preferredStyle: .alert)
        let alerAction = UIAlertAction(title: "Try again", style: .default) { (action) in
            print("The alert action button was tapped")
            self.questionsPlaceholder.append(self.questions[self.currentIndex])
            self.questions.remove(at: self.currentIndex)
            self.gotNewQuestion()
        }
        alertController1.addAction(alerAction)
        self.present(alertController1, animated: true,completion: nil)
    }
    func checkAnswer(selectedButtonTag: Int) {
        if selectedButtonTag == currentQuestion.correctAnswerIndex {
            showCorrectAnswerAlert()
            score+=1
        } else {
            showIncorrectAnswerAlert()
        }
    }
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        checkAnswer(selectedButtonTag: sender.tag)
    }
    @IBAction func resetButtonTapped(_ sender: Any) {
        resetGame()
    }
    @IBAction func unwindToQuizScreen(segue: UIStoryboardSegue) {
    
    }
    
}


