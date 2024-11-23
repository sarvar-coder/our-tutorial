//
//  TodoView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct TodoView: View {
    @Binding var selectedView: ShowState
    var body: some View {
        VStack {
            
            
            Text("Hello, World!")
        }
    }
}

#Preview {
    TodoView(selectedView: .constant(.all))
}
