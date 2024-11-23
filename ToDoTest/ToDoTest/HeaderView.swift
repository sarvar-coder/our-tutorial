//
//  HeaderView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showAddTaskView: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Bugungi Vazifalar")
                    .font(.title)
                    .lineLimit(1)
                Text("Chorshanba, 23 noy")
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            Button {
                showAddTaskView.toggle()
            } label: {
                    Image(systemName: "plus")
                    Text("Yangi Vazifa")
            }
            .buttonStyle(.bordered)
            .tint(.blue)
            
            
        }
        
    }
}

#Preview {
    HeaderView(showAddTaskView: .constant(false))
}
