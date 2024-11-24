//
//  TodoView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct TodoView: View {
    
    @Binding var selectedView: ShowState
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<TodoItems>
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        
        ScrollView {
            
            ForEach(todoItems) { todoItem in
                
                switch selectedView {
                    
                case .all:
                    TodoRowView(todoItem: todoItem,
                                onChanged: update,
                                onDelete: delete)
                    
                case .done:
                    if todoItem.completed == true {
                        TodoRowView(todoItem: todoItem,
                                    onChanged: update,
                                    onDelete: delete)
                    } else {
                        EmptyView()
                    }
                    
                case .notDone:
                    if todoItem.completed == false {
                        TodoRowView(todoItem: todoItem,
                                    onChanged: update,
                                    onDelete: delete)
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
    }
    
    func delete(_ todoItem: TodoItems) {
        context.delete(todoItem)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    TodoView(selectedView: .constant(.all))
        .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
}
