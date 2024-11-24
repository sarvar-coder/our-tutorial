//
//  StanfordGameView.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 11/11/24.
//

import SwiftUI

struct StanfordGameView: View {
    
   @ObservedObject var viewModel: EmojiStanfordGame
    
    private let  aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 8
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.bouncy, value: viewModel.cards)
            }
       
            HStack {
                Button("Shuffle") {
                    viewModel.shuffle()
                }
                Spacer()
                Button("New Game") {
                
                }
            }
        }
        .padding(spacing)
    }
   
    var cards: some View {
       
              
    
        AspectVGrid(viewModel.cards, aspectRatio: (aspectRatio)) { card  in
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                }
                .foregroundColor(.orange)
    }
}



#Preview {
    StanfordGameView(viewModel: EmojiStanfordGame())
}
