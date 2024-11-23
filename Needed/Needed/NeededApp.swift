//
//  NeededApp.swift
//  Needed
//
//  Created by Sarvar Boltaboyev on 14/11/24.
//

import SwiftUI

@main
struct NeededApp: App {
    let manager = CoreDataManager()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environment(\.managedObjectContext, manager.viewContext)
            }
        }
    }
}
