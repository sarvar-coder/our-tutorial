//
//  NeedView.swift
//  Needed
//
//  Created by Sarvar Boltaboyev on 14/11/24.
//

import SwiftUI

struct TaskRowView: View {
        let taskItem: TaskItem
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius:  3)
                .fill(.mint)
                .frame(width: 380, height: 180)
                .overlay (row)
        }
    }
    
    var row: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(taskItem.title ?? "")
                    .font(.headline)
                Spacer()
                Image(systemName: "pencil")
                    .imageScale(.large)
                    .onTapGesture {
                        print("Edit the task")
                    }
                    

            }
            .padding([.top, .leading, .trailing])
            
//            HStack {
//                Text("Urgent")
//                    .font(.footnote)
//                Spacer()
//            }
            HStack {
                Text("rescription")
            }
            .padding([.leading, .trailing])
            
            Spacer()
            HStack {
                Text("Time left:")
                Text("9")
                Spacer()
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .imageScale(.large)
                    .background(.white)
                    .cornerRadius(3.0)
                    .padding([ .bottom, .trailing])
            }
        }
    }
}

//#Preview {
//    TaskRowView()
//}
