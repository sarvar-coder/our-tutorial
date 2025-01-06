//
//  ContentView.swift
//  WatchOSAPP Watch App
//
//  Created by Sarvar Boltaboyev on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(Connectivity.shared.textMessage)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
