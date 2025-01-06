//
//  ContentView.swift
//  Needed
//
//  Created by Sarvar Boltaboyev on 14/11/24.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) private var needItems: FetchedResults<TaskItem>
    @Environment(\.managedObjectContext) private var context
    
    @State private var showAddItemView = false
    @State private var taskState: TaskState = .all
    var body: some View {
        
        VStack() {
            HeaderView(showAddItemView: $showAddItemView)
            taskView
        }
        .fullScreenCover(isPresented: $showAddItemView, content: {
            AddItemView()
        })
    }
    
    var taskView: some View {
        
        return VStack {
            Picker("", selection: $taskState) {
                Text("All").tag(TaskState.all)
                Text("ToDo").tag(TaskState.todo)
                Text("Done").tag(TaskState.done)
            }
            .pickerStyle(.segmented)
            
            ScrollView {
                ForEach(needItems) { taskItem in
                    switch taskState {
                    case .all:
                        TaskRowView(taskItem: taskItem)
                        
                            .padding(.top)
                    case .done:
                        Text("Done")
                    case .todo:
                        Text("Todo")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .environment(\.managedObjectContext, CoreDataManager.preview.viewContext)
    }
}
