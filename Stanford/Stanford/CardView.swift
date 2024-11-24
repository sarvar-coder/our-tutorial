//
//  CardView.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 24/11/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = StanfordGame<String>.Card
    var card: Card
    
    init(_ card: Card) {
        self.card = card
    }
       
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Pie(endAngle: .degrees(240))
                    .opacity(0.8)
                    
                    
                   
                
                Text(card.content)
                    .font(.system(size: 60))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
            }
            .opacity(card.isFaceUp ? 1 : 0)

            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


#Preview {
    typealias Card = StanfordGame<String>.Card
   return CardView(Card(content: "S"))
        .padding()
        .foregroundColor(.green)
}
