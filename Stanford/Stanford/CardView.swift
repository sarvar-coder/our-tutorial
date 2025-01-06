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
        Pie(endAngle: .degrees(240))
            .opacity(0.8)
            .overlay {
                Text(card.content)
                    .font(.system(size: 60))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 1), value: card.isMatched)
            }
            .padding(5)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
.linear(duration: 1).repeatForever(autoreverses: false)
    }
}


#Preview {
    typealias Card = StanfordGame<String>.Card
    return CardView(Card(content: "S"))
        .padding()
        .foregroundColor(.green)
}
