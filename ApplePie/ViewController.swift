//
//  ViewController.swift
//  ApplePie
//
//  Created by Александр Плешаков on 03.12.2023.
//

import UIKit

class ViewController: UIViewController {
    private var listOfWords = [ "buccaneer", "swift", "glorious",
    "incandescent", "bug", "program"]
    private let incorrectMovesAllowed = 7
    private var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    private var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    private var currentGame: Game!

    @IBOutlet private var lettersButtons: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var correctWordLabel: UILabel!
    @IBOutlet private weak var treeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    private func enableLetterButtons(_ enable: Bool) {
        for button in lettersButtons {
            button.isEnabled = enable
        }
    }
    
    private func newRound() {
        guard !listOfWords.isEmpty else {
            enableLetterButtons(false)
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true)
        updateUI()
    }
    
    private func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        letters[0] = letters[0].uppercased()
        var wordWithSpacing = letters.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        correctWordLabel.text = wordWithSpacing
    }
    
    private func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }

    @IBAction private func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        
    }
    
}

