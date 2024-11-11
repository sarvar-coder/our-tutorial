//
//  Sleep&AlarmView.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import SwiftUI

struct SleepAlarmView: View {
    
    @Binding  var showAlarm: Bool
    @Binding  var showSleepTime: Bool
    @Binding var wakeUp: Date
    var array = ["off", "5 min", "10 min", "15 min", "20 min"]
    var body: some View {
        VStack {
            
            Divider()
                .background(.black)
                .padding(.bottom)
            
            
            HStack {
                Text("Sleep timer")
                
                Spacer()
                Button("20 min") {
                    showSleepTime.toggle()
                }
//                } label: {
//                    Text("20 min")
//                }
                .confirmationDialog("", isPresented: $showSleepTime) {
                    
                    Button("Off") {
                        
                    }
                    Button("5 min") {
                        
                    }
                    Button("10 min") {
                        
                    }
                    Button("15 min") {
                        
                    }
                    Button("20 min") {
                        
                    }
                } message: {
                    Text("Sleep Timer")
                }   
            }
                        
            Divider()
                .background(.black)
                .padding([.top, .bottom])
            HStack {
                Text("Alarm")
                Spacer()
                Button {
                    showAlarm.toggle()
                } label: {
                    Text(wakeUp.onlyTime)
                }
            }
            Divider()
                .background(.black)
                .padding(.top)
        }
        .padding([.bottom], 90)
        
        .sheet(isPresented: $showAlarm, content: {
            NavigationStack {
                AddAlarmView(wakeUp: $wakeUp)
            }
            .presentationDetents([.fraction(0.4)])
        })
    }
}

#Preview {
    SleepAlarmView(showAlarm: .constant(false), showSleepTime: .constant(false), wakeUp: .constant(.now))
}
