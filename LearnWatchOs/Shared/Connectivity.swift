//
//  Connectivity.swift
//  WatchOSAPP Watch App
//
//  Created by Sarvar Boltaboyev on 27/11/24.
//

import Foundation
import WatchConnectivity

class Connectivity: NSObject, WCSessionDelegate, ObservableObject {
    
    @Published var textMessage = ""
    
    static let shared = Connectivity()
    
    
    
    var session: WCSession = .default
    
    override private init() {
        super.init()
        
#if !os(watchOS)
        guard WCSession.isSupported() else { return }
#endif
        
        session.delegate = self
        // To interract with paired Device
        session.activate()
    }
    
    
    
    public func send(_ message: String) {
        guard session.activationState == .activated else { return }
        
        // 1
#if os(watchOS)
        // 2
        guard WCSession.default.isCompanionAppInstalled else {
            return
        }
#else
        // 3
        guard WCSession.default.isWatchAppInstalled else {
            return
        }
#endif
        session.sendMessage(["text" : message], replyHandler: nil)
        
        
        
    }
    
    
    func session(
        _ session: WCSession, didReceiveMessage
        message: [String : Any]) {
            guard let textMessage = message["text"] as? String else { return }
            
            self.textMessage = textMessage
    }
    
    
    
    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState, error: Error?)
    {
        
    }
    
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    func sessionDidDeactivate(_ session: WCSession) {
//        reactivate their session on the new device.
        session.activate()
    }
#endif
    
}
