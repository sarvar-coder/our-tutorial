//
//  AddAlarmView.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import SwiftUI

struct AddAlarmView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var wakeUp: Date
    var body: some View {
        VStack {
            HStack {
              
                DatePicker("", selection: $wakeUp,displayedComponents: .hourAndMinute)
                    .pickerStyle(.wheel)
                    .padding([.trailing], 160)
            }
            
        }
        
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
        }
        .navigationTitle("Alarm")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AddAlarmView(wakeUp: .constant(.now))
    }
}
