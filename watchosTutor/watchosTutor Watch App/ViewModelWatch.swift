//
//  ViewModelWatch.swift
//  watchosTutor Watch App
//
//  Created by Sarvar Boltaboyev on 04/11/24.
//

import Foundation
import WatchConnectivity

class ViewModelWatch: NSObject, WCSessionDelegate, ObservableObject {
    @Published var message = ""
    
    var session: WCSession = .default
       override init(){
            super.init()
          
            self.session.delegate = self
            session.activate()
        }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
           DispatchQueue.main.async {
               self.message = message["message"] as? String ?? "Unknown"
           }
       }
}


