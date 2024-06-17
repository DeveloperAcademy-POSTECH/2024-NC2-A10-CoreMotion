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
    
    func converMotionDataToMessage(motionData: [[Double]]) -> [String: String]{
        var data: [String: String] = [:]
        for (i, datum) in motionData.enumerated() {
            let strings = datum.map { String($0) }
            data[String(i), default: "0"] = strings.joined(separator: " ")
        }
        return data
    }
    
    func sendDataToiOS (motionData: [[Double]]) {
        if session.isReachable {
            let data: [String: String] = self.converMotionDataToMessage(motionData: motionData)
            session.sendMessage(data, replyHandler: nil) { error in
                print(error.localizedDescription)
            }
            print("message sent!")
        } else {
            print("session is not reachable")
        }
    }

}
