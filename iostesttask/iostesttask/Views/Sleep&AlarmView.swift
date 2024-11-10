//
//  Sleep&AlarmView.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import SwiftUI

struct SleepAlarmView: View {
    
    @Binding  var showAlarm: Bool
    var body: some View {
        VStack {
            
            Divider()
                .background(.black)
                .padding(.bottom)
            
            
            HStack {
                Text("Sleep timer")
                
                Spacer()
                Button {
                    
                } label: {
                    Text("20 min")
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
                    Text("08:30 am")
                }
            }
            Divider()
                .background(.black)
                .padding(.top)
        }
        .padding([.bottom], 90)
        
        .sheet(isPresented: $showAlarm, content: {
            NavigationStack {
                AddAlarmView()
                    
            }
            .presentationDetents([.fraction(0.4)])
        })
    }
}

#Preview {
    SleepAlarmView(showAlarm: .constant(false))
}
