//
//  ContentView.swift
//  watchosTutor Watch App
//
//  Created by Sarvar Boltaboyev on 04/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ViewModelWatch()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(model.message)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
