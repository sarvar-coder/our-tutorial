//
//  StanfordGameView.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 11/11/24.
//

import SwiftUI

struct StanfordGameView: View {
    typealias Card = StanfordGame<String>.Card
    
    @ObservedObject var viewModel: EmojiStanfordGame
    
    private let  aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 8
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .foregroundColor(.orange)

            }
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.title)
        }
        .padding() 
    }
    
    var score: some View {
        Text("Score: \(viewModel.score)")
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        
        AspectVGrid(viewModel.cards, aspectRatio: (aspectRatio)) { card  in
            CardView(card)
                .padding(4)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                .onTapGesture {
                    withAnimation {
                        let scoreBeforeChosing = viewModel.score
                        viewModel.choose(card: card)
                        let scoreChange = viewModel.score - scoreBeforeChosing
                        lastScoreChange = (scoreChange, card.id)
                    }
                }
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: UUID())
    
    private func scoreChange(causedBy card: Card) -> Int{
        let (amount, id) = lastScoreChange
        
        return card.id == id ? amount : 0 
    }
}



#Preview {
    StanfordGameView(viewModel: EmojiStanfordGame())
}
