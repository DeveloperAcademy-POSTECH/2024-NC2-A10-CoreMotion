//
//  WatchConnector.swift
//  2024-NC2-A10-CoreMotion
//
//  Created by Hyungeol Lee on 6/16/24.
//

import Foundation
import WatchConnectivity

class WatchConnector:  NSObject, WCSessionDelegate, ObservableObject {
    @Published var message: String = ""
    var session: WCSession
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
        print("watchConnector created")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        if let error = error {
                   print("Activation error: \(error.localizedDescription)")
               } else {
                   print("Activation completed with state: \(activationState.rawValue)")
               }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    internal func session(_ session: WCSession, didReceiveMessage message : [String: Any]){
//        self.message = "123"
//        print("message received!")
//        print(message)
        
        if let messageContent = message["0"] as? String {
                    DispatchQueue.main.async {
                        self.message = String(messageContent)
                    }
            }
        if let messageContent = message["1"] as? String {
            DispatchQueue.main.async {
                self.message += String(messageContent)
            }
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        print("Reachability changed to: \(session.isReachable)")
    }
    
}
