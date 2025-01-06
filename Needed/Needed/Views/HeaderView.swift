//
//  HeaderView.swift
//  Needed
//
//  Created by Sarvar Boltaboyev on 14/11/24.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showAddItemView: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("TaskApp")
                    .font(.largeTitle)
                    .bold()
                Text("Motivation")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Button {
                showAddItemView.toggle()
            } label: {
                HStack {
                    Text("Add Task")
                    Image(systemName: "plus")
                        .imageScale(.large)
                    
                }
            }
            .buttonStyle(.bordered)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    HeaderView(showAddItemView: .constant(false))
}
