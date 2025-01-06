//
//  TodoView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI
var networkLoaded = true
struct TodoView: View {
    
    @Binding var selectedView: ShowState
    @Binding var sheetState: SheetState?
    
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<TodoItems>
    @Environment(\.managedObjectContext) private var context
   
    @ObservedObject var viewModel: ViewModel
    
    
    var body: some View {
        Text("\(todoItems.count)")
        ScrollView {
            
            ForEach(networkLoaded ? initialTasks : todoItems ) { todoItem in
                
                switch selectedView {
                    
                case .all:
                    TodoRowView(todoItem: todoItem,
                                onChanged: update,
                                onDelete: delete,
                                sheetState: $sheetState)
                    
                case .done:
                    if todoItem.completed == true {
                        TodoRowView(todoItem: todoItem,
                                    onChanged: update,
                                    onDelete: delete,
                                    sheetState: $sheetState)
                    } else {
                        EmptyView()
                    }
                    
                case .notDone:
                    if todoItem.completed == false {
                        TodoRowView(todoItem: todoItem,
                                    onChanged: update,
                                    onDelete: delete,
                                    sheetState: $sheetState)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
    
    func update(_ todo: TodoItems) {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        print(todoItems.count)
        
    }
    
    func save() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        networkLoaded = false
        UserDefaults.standard.setValue(networkLoaded, forKey: "network")
    }
    
    func delete(_ todoItem: TodoItems) {
        context.delete(todoItem)
        
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
  
    var initialTasks: FetchedResults<TodoItems> {
        let initialTasks = todoItems
        for (item) in viewModel.todos {
            let todoItem = TodoItems(context: context)
            todoItem.todo = item.todo
            todoItem.completed = item.completed
        }
        save()
        return initialTasks
    }
}

#Preview {
    TodoView(
        selectedView: .constant(.all),
        sheetState: .constant(.none),
        viewModel: ViewModel()
    )
    .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
}
