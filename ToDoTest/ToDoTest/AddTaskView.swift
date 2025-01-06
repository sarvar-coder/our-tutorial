//
//  AddTaskView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var text = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    let todoItem: TodoItems!
    
    var body: some View {
        NavigationStack {
            Form {
                if let todoItem {
                    TextField("Title", text: Binding(get: {
                        todoItem.todo ?? ""
                    }, set: { newValue in
                        todoItem.todo = newValue
                    }))
                } else {
                    TextField("Title", text: $text)
                }
                    
                
                
            }
            .navigationTitle(todoItem == nil ? "Add Task" : "Edit Task")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if todoItem == nil {
                            save()
                        } else {
                            update(todoItem)
                        }
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                    .disabled(todoItem == nil ? !isFormValid : isFormValid)
                }
            }
        }
        .presentationDetents([.fraction(0.4), .medium])
    }
    
   private func save() {
       let todoItem = TodoItems(context: context)
       todoItem.todo = text
       todoItem.completed = false
       
       do {
           try context.save()
       } catch {
           print(error.localizedDescription)
       }
    }
    
    private func update(_ todoItem: TodoItems) {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    
    var isFormValid: Bool {
        !text.isWhiteEmptySpace
    }
}

//#Preview {
//    AddTaskView(todoItem: TodoItems?)
//}
