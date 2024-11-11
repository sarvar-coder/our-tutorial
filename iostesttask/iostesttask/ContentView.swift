//
//  ContentView.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlarm = false
    @State private var showSleepTime = false
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
        
            HeaderView()
            
            SleepAlarmView(showAlarm: $showAlarm, showSleepTime: $showSleepTime, wakeUp: $wakeUp)
            
            Button {
                
            } label: {
                Text("Pause")
                    .frame(width: 300, height: 45)
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


