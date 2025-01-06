//
//  iostesttaskApp.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import SwiftUI
import UserNotifications

@main
struct iostesttaskApp: App {
    init() {
        requestNotificationPermission()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting permission: \(error)")
            }
            granted ? print("Accept") : print("Denied")
        }
    }
}
