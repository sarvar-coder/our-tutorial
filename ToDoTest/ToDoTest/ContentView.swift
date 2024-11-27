//
//  ContentView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var showAddTaskView = false
    @State private var sheetState: SheetState?
    @State private var networkLoaded = false
    @Environment(\.managedObjectContext) private var context
    @StateObject var viewModel: ViewModel
    
    
    var body: some View {
     
        ZStack {
            
            VStack(alignment: .leading) {
                
                HeaderView(sheetState: $sheetState)
                    .padding()
                
                MainView(sheetState: $sheetState, viewModel: viewModel)

                Spacer()
            }
//            .sheet(isPresented: $showAddTaskView) { AddTaskView() }
            .sheet(item: $sheetState) { state in
                switch state {
                case .add:
                    AddTaskView(todoItem: nil)
                case .edit(let todoItem):
                    AddTaskView(todoItem: todoItem)
                }
            }
        }
        .background(.gray.opacity(0.19))
    }
    
}

#Preview {
    ContentView(viewModel: ViewModel())
        .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
}

enum SheetState:Identifiable {
    case add
    case edit(TodoItems)
    
    var id: Int {
        switch self {
        case .add:
            1
        case .edit(_):
            2
        }
    }
}

