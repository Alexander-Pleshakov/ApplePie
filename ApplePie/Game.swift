//
//  Game.swift
//  ApplePie
//
//  Created by Александр Плешаков on 03.12.2023.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var resultWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                resultWord += String(letter)
            } else {
                resultWord += "_"
            }
        }
        return resultWord
    }
    
    mutating func playerGuessed(letter: Character) {
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
        guessedLetters.append(letter)
    }
}
