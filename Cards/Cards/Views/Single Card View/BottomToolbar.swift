//
//  BottomToolbar.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 30/12/24.
//

import SwiftUI

struct BottomToolbar: View {
    @Binding var modal: ToolbarSelection?
    var body: some View {
        
        HStack {
            ForEach(ToolbarSelection.allCases) { selection in
                Button {
                    modal = selection
                } label: {
                    ToolbarButton(modal: selection)
                }
            }
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.none))
}

struct ToolbarButton: View {
    let modal: ToolbarSelection
    
    private let modalButton:
    [ToolbarSelection: (text: String, imageName: String)] =
    [
        .frameModal: ("Frame", "square.on.circle"),
        .photoModal: ("Photos", "photo"),
        .stickerModal: ("Stickers", "heart.circle"),
        .textModal: ("Text", "textformat")
    ]
    
    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(text) }
            .padding(.top)
        }
    }
}
