//
//  AddItemView.swift
//  Needed
//
//  Created by Sarvar Boltaboyev on 14/11/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    
    @State private var text = ""
    @State private var description = ""
    @State private var priority = 0
    @State private var colorSelection: Color = .red
    var body: some View {
        VStack {
            headerView
            titleField
            descriptionField
            colorPcikerView
            Spacer()
        }
    }
    
    func createAndSave() {
        let item = TaskItem(context: context)
        item.title = text
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    var headerView: some View {
        HStack(spacing: 100) {
            Button {
                dismiss()
            } label: {
                Text("Cancel")
            }
            Text("Add Item")
                .bold()
            Button {
                createAndSave()
                dismiss()
            } label: {
                Text("Done")
            }
            
        }
        .padding(.top)
    }
    
    var titleField: some View {
        VStack {
            HStack {
                Text("Task Title")
                    .padding([.leading, .top])
                Spacer()
            }
            Divider()
            HStack {
                Image(systemName: "pencil")
                    .foregroundColor(.secondary)
                TextField("Title", text: $text)
            }
             
//                    .textFieldStyle(.roundedBorder)
            .padding([.leading, .top, .bottom])
        }
    }
    
    var priorityView: some View {
        VStack {
            HStack {
                Text("Task Priority")
                    .padding([.leading, .top])
                Spacer()
            }
            Divider()
            Picker("", selection: $priority) {
                Text("Urgent").tag(0)
                Text("Medium").tag(1)
                Text("Bemalol").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
    
    var descriptionField: some View {
        VStack {
            HStack {
                Text("Task Description")
                    .padding([.leading, .top])
                Spacer()
            }
            Divider()
            HStack {
                Image(systemName: "pencil")
                    .foregroundColor(.secondary)
                TextField("Description", text: $description)
            }
            .padding([.leading, .top])
        }
    }
    
    var colorPcikerView: some View {
        let color: [Color] = [.red, .blue, .cyan, .yellow, .green,.purple, .pink, .mint]
        return VStack {
            HStack {
                Text("Task Colors")
                    .padding([.leading, .top])
                Spacer()
            }
            Divider()
            HStack {
                ForEach(color, id: \.self) { color in
                    
                    Circle()
                        .fill(color)
                        .frame(width: 40, height: 40)
                        .overlay (
                            colorSelection == color ? Circle().stroke(Color.gray, lineWidth: 3) : nil
                        )
                        .onTapGesture {
                            colorSelection = color
                        }
                       
                    
                        
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    AddItemView()
}
