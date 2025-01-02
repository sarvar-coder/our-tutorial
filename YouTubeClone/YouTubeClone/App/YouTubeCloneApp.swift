//
//  YouTubeCloneApp.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 29/11/24.
//

import SwiftUI

@main
struct YouTubeCloneApp: App {
    @StateObject private var images = Images()
    var body: some Scene {
        WindowGroup {
            ContentView(images: images)
        }
    }
}
