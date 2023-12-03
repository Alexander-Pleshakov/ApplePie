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
    private var totalWins = 0
    private var totalLosses = 0
    private var currentGame: Game!

    @IBOutlet private var lettersButtons: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var correctWordLabel: UILabel!
    @IBOutlet private weak var treeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    private func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    private func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    @IBAction private func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
    }
    
}

