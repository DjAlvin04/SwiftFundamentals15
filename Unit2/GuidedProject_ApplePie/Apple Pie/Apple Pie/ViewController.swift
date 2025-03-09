//
//  ViewController.swift
//  Apple Pie
//
//  Created by Andy Kromeh on 3/8/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { // Added UITextFieldDelegate
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }

    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet weak var wordGuessTextField: UITextField! //Adding a textfield
    
    var currentGame: Game!
    var score = 0 // Added score variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordGuessTextField.delegate = self // Set delegate
        newRound()
    }

    

    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            wordGuessTextField.text = "" // clear textfield
            updateUI()
        } else {
            enableLetterButtons(false)
            wordGuessTextField.isEnabled = false // disable textfield
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButtons {
        button.isEnabled = enable
      }
    }

    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Score: \(score), Wins: \(totalWins), Losses: \(totalLosses)" // Updated score label
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }


    @IBAction func letterButtonPressed(_ sender: UIButton)  {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        if currentGame.word.contains(letter) {
            score += 10 // Add points for correct letter
        }
        updateGameState()
    }

    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
            score -= 50; //Penalize for loss
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            score += 100 // Award points for word completion
        } else {
            updateUI()
            return;
        }
        updateUI()
    }

    
    @IBAction func enterWordButtonPressed(_ sender: UIButton) {
        if let guessedWord = wordGuessTextField.text?.lowercased() {
            if guessedWord == currentGame.word {
                totalWins += 1
                score += 100
            } else {
                totalLosses += 1
                score -= 50; //Penalize for loss
            }
            updateGameState()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            enterWordButtonPressed(UIButton())
            return true
    }
}

