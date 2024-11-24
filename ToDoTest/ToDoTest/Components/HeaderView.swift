//
//  HeaderView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showAddTaskView: Bool
    @State private var todayDate = Date()
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text("Today's Task")
                    .font(.title)
                    .lineLimit(1)
                
                Text(todayDate.dayAndMonth)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                showAddTaskView.toggle()
            } label: {
                Image(systemName: "plus")
                Text("New Task")
            }
            .buttonStyle(.bordered)
            .tint(.blue)
        }
    }
}

#Preview {
    HeaderView(showAddTaskView: .constant(false))
}
