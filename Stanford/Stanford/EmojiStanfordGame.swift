//
//  EmojiStanfordGame.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 15/11/24.
//

import Foundation
import SwiftUI

class EmojiStanfordGame: ObservableObject {
    typealias Card = StanfordGame<String>.Card
    
   private static let emojis = ["🤬", "😟", "😠", "😃", "🧠", "🥳", "🪲", "🐣", "🥋", "🐳"]
    
    private static func createStanfordGame() -> StanfordGame<String> {
        StanfordGame(numberOfPaiarsOfCards: 2) { pairIndex in
            if emojis.indices.contains(0) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
      
    @Published private var model = createStanfordGame()
    
    var cards: Array<Card> {
        get { model.cards }
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - INTENTS
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(card: Card) {
        model.choose(card)
    }
}

