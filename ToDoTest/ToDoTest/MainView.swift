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
        TabView(selection: $selectedTab) {
            ForEach(ShowState.allCases, id: \.self) { state in
                Text(state.rawValue)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    MainView()
}

enum ShowState: String, CaseIterable {
    case all = "Barcha"
    case done = "Ochiq"
    case notDone = "Yopiq"
}
