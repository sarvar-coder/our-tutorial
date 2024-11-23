//
//  EmojiStanfordGame.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 15/11/24.
//

import Foundation
import SwiftUI

class EmojiStanfordGame: ObservableObject {
    
   private static let emojis = ["🤬", "😟", "😠", "😃", "🧠", "🥳", "🪲", "🐣", "🥋", "🐳"]
    
    private static func createStanfordGame() -> StanfordGame<String> {
        StanfordGame(numberOfPaiarsOfCards: 10) { pairIndex in
            if emojis.indices.contains(0) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
     
    @Published private var model = createStanfordGame()
    
    var cards: Array<StanfordGame<String>.Card> {
        get { model.cards }
    }
    
    // MARK: - INTENTS
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(card: StanfordGame<String>.Card) {
        model.choose(card)
    }
}

