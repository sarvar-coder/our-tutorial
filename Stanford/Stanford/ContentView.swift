//
//  ContentView.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    
    let array = ["🤬", "😟", "😠", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶", "🥶"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            barComponents
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index  in
                CardView(content: array[index])
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(.orange)
        }
    }
    
    var barComponents: some View {
        HStack {

            removeCardButton
            Spacer()
            addCardButton
            
        }
    }
    
    var addCardButton: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var removeCardButton: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
            .tint(.red)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
                cardCount += offset
        } label: {
            Image(systemName: symbol)
                .imageScale(.large)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > array.count)
     
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var content: String
    @State  var isFaceup = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text(content)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .opacity(isFaceup ? 1 : 0)
               
            
            base.fill().opacity(isFaceup ? 0 : 1)
            
        }
        .onTapGesture {
            print("tapped")
            self.isFaceup.toggle()
        }
    }
}
