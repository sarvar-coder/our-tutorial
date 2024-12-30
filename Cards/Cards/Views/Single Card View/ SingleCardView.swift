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
    
    var body: some View {
        NavigationStack {
            Color.yellow
            
                .sheet(item: $currentModal) { item in
                    switch item {
                    default:
                        Text(String(describing: item))
                        
                    }
                }
            
                .toolbar {
                    ToolbarItem() {
                        Button("Done") {
                            dismiss() }
                    }
                    
                ToolbarItem(placement: .bottomBar) {
                    BottomToolbar(modal: $currentModal)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SingleCardView()
    }
}
