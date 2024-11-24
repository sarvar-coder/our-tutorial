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
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $text)
                
            }
            .navigationTitle("Add Task")
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
                        save()
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                    .disabled(!isFormValid)
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
    
    var isFormValid: Bool {
        !text.isWhiteEmptySpace
    }
}

#Preview {
    AddTaskView()
}
