//
//  AddNewQuestionViewController.swift
//  triviaBois
//
//  Created by Chris Cook on 7/23/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit

class AddNewQuestionViewController: UIViewController {
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    
    @IBOutlet weak var answer4TextField: UITextField!
    
    @IBOutlet weak var correctAnswerSegmentedController: UISegmentedControl!
    
    var newQuestion: TriviaQuestion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
      In a storyboard-based application, you will often want to do a little preparation before navigation
     */
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       print("segue triggered")
        let destinationViewController = segue.destination as! QuizViewController
     destinationViewController.questions.append(newQuestion)
     }
    func showErrorAlert() {
        let errorAlertController = UIAlertController(title: "error", message: "All text fields must be filled out to make new question", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        errorAlertController.addAction(alertAction)
        self.present(errorAlertController, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let questionText = questionTextField.text, !questionText.isEmpty else {
            showErrorAlert()
            return
        }
        guard let firstAnswerText = answer1TextField.text, !firstAnswerText.isEmpty else {
            showErrorAlert()
            return
        }
        guard let secondAnswerText = answer2TextField.text, !secondAnswerText.isEmpty else {
            showErrorAlert()
            return
        }
        guard let thirdAnswerText = answer3TextField.text, !thirdAnswerText.isEmpty else {
            showErrorAlert()
            return
        }
        guard let fourthAnswerText = answer4TextField.text, !fourthAnswerText.isEmpty else {
            showErrorAlert()
            return
        }
        let selectedSegmentIndex = correctAnswerSegmentedController.selectedSegmentIndex
        newQuestion = TriviaQuestion(question: questionText, answers: [firstAnswerText,secondAnswerText,thirdAnswerText,fourthAnswerText], correctAnswerIndex: selectedSegmentIndex)
        self.performSegue(withIdentifier: "unwindToQuizScreen", sender: self)
    }
}
