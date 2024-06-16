//
//  WatchToiOSConnector.swift
//  2024-NC2-A10-CoreMotion
//
//  Created by Hyungeol Lee on 6/16/24.
//

import Foundation
import WatchConnectivity

class WatchToiOSConnector:  NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = WCSession.default
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
     
    }
    
    func sendDataToiOS (motionData: [[Double]]) {
        if session.isReachable {
            let data: [String: Double] = [
                "A" : 0.0,
                "B" : 0.0,
                "C" : 0.0
            ]
            session.sendMessage(data, replyHandler: nil) { error in
                print(error.localizedDescription)
            }
            print("message sent!")
        } else {
            print("session is not reachable")
        }
    }

}
