//
//  ViewModel.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Lyosha's MacBook   on 6/19/24.
//

import Foundation
import CoreMotion

private var timer: Timer?

enum DripSessionStatus{
    case preparing
    case ongoing
    case complete
    var getDaga: String{
        switch self{
        case .preparing :
            return "준비중"
        case .ongoing :
            return "진행중"
        case .complete:
            return "완료"
        }
    }
}

struct DripSessionModel {
    var Dripper: String = ""
    var beanAmount: Int = 0
    var pourTimeSums: [Double] = []
    var waterQuantities: [Double] = []
}

class ViewModel: ObservableObject {
    @Published var accX = 0.0
    @Published var accY = 0.0
    @Published var accZ = 0.0
    
    @Published var rotX = 0.0
    @Published var rotY = 0.0
    @Published var rotZ = 0.0
    @Published var motionData: [[Double]] = [[0.0, 0.0, 0.0, 0.0, 0.0, 0.0]]
    
    @Published var accXs = [0.0]
    @Published var accYs = [0.0]
    @Published var accZs = [0.0]
    @Published var rotXs = [0.0]
    @Published var rotYs = [0.0]
    @Published var rotZs = [0.0]
    @Published var prediction = ""
    @Published var pourTimeSum: Double = 0.0
    @Published var dripSessionModel = DripSessionModel()
    @Published var predictManager = PredictManager()
    @Published var motionManager = CMMotionManager()
    @Published var status: DripSessionStatus = .preparing
    
    
    func updateMotionData(){
        self.motionData.append([self.accX, self.accY, self.accZ, self.rotX, self.rotY, self.rotZ])
        self.accXs.append(self.accX)
        self.accYs.append(self.accY)
        self.accZs.append(self.accZ)
        self.rotXs.append(self.rotX)
        self.rotYs.append(self.rotY)
        self.rotZs.append(self.rotZ)
        
    }
    
    func startDripSession() {
        guard timer == nil else { return } // Prevent multiple timers
        
        let strongSelf = self // Capture `self` strongly once
        timer = Timer.scheduledTimer(withTimeInterval: 1/2, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.prediction = strongSelf.predictManager.predict(strongSelf.accXs, strongSelf.accYs, strongSelf.accZs, strongSelf.rotXs, strongSelf.rotYs, strongSelf.rotZs)
                
                if self.prediction == "크게" || self.prediction == "작게" {
                    self.pourTimeSum += 1/2
                }
            }
        }
    }
    
    func recordPourTime(){
        
    }
    
    func endDripSession(){
        timer?.invalidate()
        timer = nil
        
    }
    
    
    
    func startRecordingDeviceMotion() {
        // Device motion을 수집 가능한지 확인
        guard motionManager.isDeviceMotionAvailable else {
            print("Device motion data is not available")
            return
        }
        
        // 모션 갱신 주기 설정 (100Hz)
        motionManager.deviceMotionUpdateInterval = 0.01
        // Device motion 업데이트 받기 시작
        motionManager.startDeviceMotionUpdates(to: .main) { (deviceMotion: CMDeviceMotion?, error: Error?) in
            guard let data = deviceMotion, error == nil else {
                print("Failed to get device motion data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            // 필요한 센서값 불러오기
            let acceleration = data.userAcceleration
            
            self.accX = acceleration.x
            self.accY = acceleration.y
            self.accZ = acceleration.z
            
            let rotationRate: CMRotationRate = data.rotationRate
            
            self.rotX = rotationRate.x
            self.rotY = rotationRate.y
            self.rotZ = rotationRate.z
            
            self.updateMotionData()
        }
    }
    
    
    func stopRecordingDeviceMotion() {
        //        watchToiOSConnector.sendDataToiOS(motionData: viewModel.motionData)
        print("send!")
        
        motionManager.stopDeviceMotionUpdates()
        motionData = [[0.0, 0.0, 0.0, 0.0, 0.0, 0.0]]
        self.accX =  0.0
        self.accY = 0.0
        self.accZ = 0.0
        self.rotX = 0.0
        self.rotY = 0.0
        self.rotZ = 0.0
        self.accXs = [0.0]
        self.accYs = [0.0]
        self.accZs = [0.0]
        self.rotXs = [0.0]
        self.rotYs = [0.0]
        self.rotZs = [0.0]
    }
}



