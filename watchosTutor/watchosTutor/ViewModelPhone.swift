//
//  ViewModelPhone.swift
//  watchosTutor
//
//  Created by Sarvar Boltaboyev on 04/11/24.
//

import Foundation
import WatchConnectivity

class ViewModelPhone: NSObject, WCSessionDelegate {
    var session: WCSession = .default
    override init() {
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
