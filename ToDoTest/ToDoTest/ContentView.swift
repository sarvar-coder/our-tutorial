//
//  ContentView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddTaskView = false
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(showAddTaskView: $showAddTaskView)
                .padding(.bottom)
            
            MainView()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
