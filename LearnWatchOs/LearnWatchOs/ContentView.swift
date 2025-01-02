//
//  ContentView.swift
//  LearnWatchOs
//
//  Created by Sarvar Boltaboyev on 27/11/24.
//

import SwiftUI

struct ContentView: View {

    @State private var text = ""
    
    var body: some View {
        VStack {
            
            Text("Connected WatchOS: ")
                .padding([.bottom], 50)
            
            TextField("Type in", text: $text)
                .textFieldStyle(.roundedBorder)
                .border(.black)
                .padding(.bottom)
//                .onChange(of: text) { oldValue, newValue in
//                    connectivity.send(newValue)
//                }
            
            Button {
                Connectivity.shared.send(text)
            } label: {
                 Text("Send message")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
