//
//  StanfordGameView.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 11/11/24.
//

import SwiftUI

struct StanfordGameView: View {
    
   @ObservedObject var viewModel: EmojiStanfordGame
    
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
        .padding()
    }
   
    var cards: some View {
       
    GeometryReader { geometry in
              
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 0) {
    
                ForEach(viewModel.cards) { card  in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fill)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                }
                .foregroundColor(.orange)
            }
        }
    }
    
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        aspectRatio: CGFloat
    ) -> CGFloat {
        let columnCount = 1
        
        repeat {
            let width = size.width / CGFloat(columnCount)
            let height = width / aspectRatio
            
            let rowCount = Double(count / columnCount).rounded(.up)
            
            if rowCount * height < size.height {
                return (size.width / CGFloat(columnCount)).rounded(.down)
            }
            
        } while columnCount < count
         
        return min(size.width / CGFloat(count), size.height * aspectRatio).rounded(.down)
    }
}

struct CardView: View {
    var card: StanfordGame<String>.Card
    
    init(_ card: StanfordGame<String>.Card) {
        self.card = card
    }
       
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 60))
            }
            .opacity(card.isFaceUp ? 1 : 0)

            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


#Preview {
    StanfordGameView(viewModel: EmojiStanfordGame())
}
