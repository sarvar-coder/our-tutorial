//
//  TodoRowView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct TodoRowView: View {
    let todoItem: TodoItems
    let onChanged: (TodoItems) -> Void
    let onDelete: (TodoItems) -> Void
    @Binding var sheetState: SheetState?
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(width: 380, height: 130)
            .overlay(components)
            
    }
    
    @ViewBuilder
    var components: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(todoItem.todo ?? "")
                        .padding(.bottom, 10)
//                    HStack {
//                        MyDatePicker()
//                    }
                    
                }
                Spacer()
                
                Image(systemName: todoItem.completed ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        todoItem.completed.toggle()
                        onChanged(todoItem)
                    }
            }
            ExDivider1()
            
            HStack {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
                    .onTapGesture {
                        onDelete(todoItem)
                    }
                Spacer()
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
//                        NotificationCenter.default.post(name: .showEditView, object: nil)
                        sheetState = .edit(todoItem)
                    }
            }
            Spacer()
        }
        .padding()
    }
}

struct ExDivider1: View {
    let color: Color = .gray
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct MyDatePicker: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        
        // Put your own design here
        Text(startDate.onlyDayName)
            .foregroundColor(.secondary)
            .font(.footnote)
        
        Text(startDate.hourAndMinute)
            .foregroundColor(.secondary)
            .font(.footnote)
            .bold()
        
        Text("-")
            .bold()
            .foregroundColor(.secondary)
        
        Text(endDate.hourAndMinute)
            .font(.footnote)
            .bold()
            .overlay {
                DatePicker(selection: $endDate, displayedComponents: .hourAndMinute) {}
                    .labelsHidden()
                    .colorMultiply(.clear)
                    .pickerStyle(WheelPickerStyle())
            }
    }
}
