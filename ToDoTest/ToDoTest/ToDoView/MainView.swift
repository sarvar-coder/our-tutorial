//
//  MainView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: ShowState = .all
    @Binding var sheetState: SheetState?
    @StateObject var viewModel: ViewModel
    var body: some View {
        
        SegmentedView(selectedView: $selectedTab, count: viewModel.todos.count)
            .padding()
        TodoView(selectedView: $selectedTab, sheetState: $sheetState, viewModel: viewModel)
 
    }
}

#Preview {
    MainView(
        sheetState: .constant(.none), viewModel: ViewModel()
    )
}

enum ShowState: String, CaseIterable {
    case all = "All"
    case done = "Closed"
    case notDone = "Open"
}
