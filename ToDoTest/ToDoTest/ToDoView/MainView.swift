//
//  MainView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: ShowState = .all
    
    var body: some View {
        
        SegmentedView(selectedView: $selectedTab)
            .padding()
        TodoView(selectedView: $selectedTab)
 
    }
}

#Preview {
    MainView()
}

enum ShowState: String, CaseIterable {
    case all = "All"
    case done = "Closed"
    case notDone = "Open"
}
