//
//  AddAlarmView.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import SwiftUI
import UserNotifications

struct AddAlarmView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var wakeUp: Date
    var body: some View {
        VStack {
            HStack {
                
                DatePicker("", selection: $wakeUp,displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding([.trailing], 30)
                    
            }
        }
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                    setAlarm()
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
    
    private func setAlarm() {
        let calender = Calendar.current
        let hour = calender.component(.hour, from: wakeUp)
        let minute = calender.component(.minute, from: wakeUp)
        
        scheduleAlarmNotification(hour: hour, minute: minute)
        print("isSet")
    }
    
    func scheduleAlarmNotification(hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Wake up"
        content.body = "It's time to get up"
        content.sound = .defaultRingtone
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "alarm", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Alarm scheduled for \(hour):\(minute)")
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        AddAlarmView(wakeUp: .constant(.now))
    }
}
