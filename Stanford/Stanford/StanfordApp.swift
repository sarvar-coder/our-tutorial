//
//  StanfordApp.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 11/11/24.
//

import SwiftUI

@main
struct StanfordApp: App {
    @StateObject var game = EmojiStanfordGame()
    var body: some Scene {
        WindowGroup {
            StanfordGameView(viewModel: game)
        }
    }
}
