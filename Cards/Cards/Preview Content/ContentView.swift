//
//  ContentView.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 30/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var siljish: CGSize = .zero
    var body: some View {
            Text("Salom, Dunyo!")
                .font(.largeTitle)
                .padding()
                .background(Color.yellow)
                .onTapGesture {
                    siljish = CGSize(width: 200, height: 200)
                }
                .onTapGesture(count: 2, perform: {
                    siljish = .zero
                })
                .offset(x: siljish.width, y: siljish.height) // X: 50 va Y: 100 pikselga siljitish
        }
}

#Preview {
    ContentView()
}
