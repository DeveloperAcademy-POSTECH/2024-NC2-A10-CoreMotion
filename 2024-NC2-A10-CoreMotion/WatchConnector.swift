//
//  WatchConnector.swift
//  2024-NC2-A10-CoreMotion
//
//  Created by Hyungeol Lee on 6/16/24.
//

import Foundation
import WatchConnectivity
import UIKit

class WatchConnector:  NSObject, WCSessionDelegate, ObservableObject {
    @Published var message: String = ""
    @Published var messageContent: [String: Any] = ["":""]
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
                print("message received!")
        //        print(message)
        self.messageContent = message
        
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
        
//        self.exportDictionaryToCSV(data: message, fileName: "output.csv")
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        print("Reachability changed to: \(session.isReachable)")
    }
    
    func exportDictionaryToCSV() -> URL {
        var data = self.messageContent
        var fileURL: URL!
        var csvString = "Key,Value\n"
        for (key, value) in data {
            csvString += "\(key),\(String(describing: value))\n"
        }
        let filename = "output.csv"
        
        let fileManager = FileManager.default
        do {
            // Get user's documents directory
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            // Append filename to documents directory path
            fileURL = documentsDirectory.appendingPathComponent(filename)
            
            // Write CSV string to file
            try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
            
            print("CSV file '\(filename)' successfully exported to \(documentsDirectory.path)")
        } catch {
            print("Error exporting CSV file: \(error.localizedDescription)")
        }
        return fileURL
    }
    //    func exportDictionaryToCSV(data: [String: Any], fileName: String) {
    //        // Convert the dictionary to a CSV formatted string
    //        var csvString = "Key,Value\n"
    //        for (key, value) in data {
    //            csvString += "\(key),\(String(describing: value))\n"
    //        }
    //
    //        // Get the file path to save the CSV file
    //        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    //            let fileURL = dir.appendingPathComponent(fileName)
    //
    //            // Write the CSV string to the file
    //            do {
    //                try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
    //                print("CSV file saved successfully at \(fileURL.path)")
    //            } catch {
    //                print("Failed to write CSV file: \(error)")
    //            }
    //        }
    //    }
    
    
}
