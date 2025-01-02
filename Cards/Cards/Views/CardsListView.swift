//
//  CardsListView.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 30/12/24.
//

import SwiftUI

struct CardsListView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        
        list
        .fullScreenCover(isPresented: $isPresented) {
            SingleCardView()
        }
    }
    
    var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnail()
                        .onTapGesture {
                          isPresented = true
                        }                        
                }
            }
        }
    }
}

#Preview {
    CardsListView()
}

