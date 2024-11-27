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
    @StateObject var viewModel = ViewModel(loaded: UserDefaults.standard.bool(forKey: "network"))
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .environment(\.managedObjectContext, provider.viewContext)
        }
    }
}

