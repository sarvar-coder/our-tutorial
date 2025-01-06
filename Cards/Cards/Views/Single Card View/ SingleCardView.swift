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
            content
                .cardToolbar($currentModal)
        }
    }
    
    var content: some View {
        ZStack {
            Group {
                Capsule()
                    .foregroundColor(.yellow)
                Text("Resize Me!")
                    .fontWeight(.bold)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                
            }
            .resizableView()
            
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
        }
    }
}

#Preview {
    NavigationStack {
        SingleCardView()
    }
}
