//
//  Game.swift
//  Apple Pie
//
//  Created by Andy Kromeh on 3/8/25.
//

import Foundation

//
//  Game.swift
//  Apple Pie
//
//  Created by Andy Kromeh on 3/8/25.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]

    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }

    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
    
    
    
    
    



