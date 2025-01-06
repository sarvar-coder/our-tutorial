//
//  ContentView.swift
//  watchosTutor
//
//  Created by Sarvar Boltaboyev on 04/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    @State private var reacheble = "No"
    
    var model = ViewModelPhone()
    
    var body: some View {
        VStack {
            TextField("text", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 15)
            
            Button {
                self.model.session.sendMessage(["message": self.text], replyHandler: nil) { error in
                    print(error.localizedDescription)}
            } label: {
                Text("Send message")
            }
            
            Text("Reachable - \(reacheble)")
                .padding(.bottom, 15)
            Button {
                if self.model.session.isReachable {
                    self.reacheble = "Yes"
                } else {
                    self.reacheble = "bow"
                }
            } label: {
                 Text("Update")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
