//
//  ContentView.swift
//  Pagination
//
//  Created by Sarvar Boltaboyev on 21/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("JSON Parsing")
        }
    }
}

#Preview {
    ContentView()
}
