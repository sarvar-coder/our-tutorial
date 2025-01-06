//
//  ContentView.swift
//  Networking
//
//  Created by Sarvar Boltaboyev on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    var body: some View {
        VStack {
            Text("\(viewModel.coin): \(viewModel.price)")
        }
        .padding()
    }
}
   
#Preview {
    ContentView()
}
