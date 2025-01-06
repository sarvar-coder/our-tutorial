//
//  CardToolbar.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 01/01/25.
//

import Foundation
import SwiftUI

struct CardToolbar: ViewModifier {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var currentModal: ToolbarSelection?
    
    func body(content: Content) -> some View {
        content
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

extension View {
    func cardToolbar(_ toolbarSelection: Binding<ToolbarSelection?>) -> some View {
        modifier(CardToolbar(currentModal: toolbarSelection))
    }
}
