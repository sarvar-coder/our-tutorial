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
     
        ZStack {
            
            VStack(alignment: .leading) {
                
                HeaderView(showAddTaskView: $showAddTaskView)
                    .padding()
                
                MainView()
                
                Spacer()
            }
            .sheet(isPresented: $showAddTaskView) { AddTaskView() }
        }
        .background(.gray.opacity(0.19))
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
}
