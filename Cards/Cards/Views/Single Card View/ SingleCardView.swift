//
//   SingleCardView.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 30/12/24.
//

import SwiftUI

struct SingleCardView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentModal: ToolbarSelection?
    @Binding var card: Card
    
    var body: some View {
        NavigationStack {
            content
                .cardToolbar($currentModal)
        }
    }

    var content: some View {
        CardDetailView(card: $card)
    }
}

#Preview {
    NavigationStack {
        SingleCardView(card: .constant(initialCards[0]))
    }
}
