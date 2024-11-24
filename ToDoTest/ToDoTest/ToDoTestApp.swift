//
//  ToDoTestApp.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

@main
struct ToDoTestApp: App {
    let provider = CoreDataProvider()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, provider.viewContext)
        }
    }
}
