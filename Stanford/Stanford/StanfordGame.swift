//
//  StanfordGame.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 15/11/24.
//

import Foundation

struct StanfordGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    init(numberOfPaiarsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(10, numberOfPaiarsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp } .only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0)} }
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(of: card) else { return } 
        
        if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } 
//                else {
//                    if cards[chosenIndex].hasBeenSeen {
//                       score -= 1
//                    }
//                    if cards[chosenIndex].hasBeenSeen {
//                      score -= 1
//                    }
//                }
//                indexOfTheOneAndOnlyFaceUpCard = nil  // wrong implemataton
                
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable, CustomDebugStringConvertible {
        let id = UUID()
        var isFaceUp = false {
            didSet {
                if oldValue && !isFaceUp {
                    hasBeenSeen = true
                }
            }
        }
        var hasBeenSeen = false
        var isMatched = false
        let content: CardContent
        
        var debugDescription: String {
            "\(id): content: \(content) \(isFaceUp ? "up" : "dowm") \(isMatched ? "matched" : "NOTmatched")"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
