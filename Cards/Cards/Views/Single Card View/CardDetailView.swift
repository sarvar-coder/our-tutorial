//
//  CardDetailView.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 07/01/25.
//

import SwiftUI

struct CardDetailView: View {

    @EnvironmentObject var store: CardStore
    @Binding var card: Card
    
    var body: some View {
        ZStack {
            card.backgroundColor
            
        }
    }
}

#Preview {
    CardDetailView(card: .constant(initialCards[0]))
        .environmentObject(CardStore(defaultData: true))
}
