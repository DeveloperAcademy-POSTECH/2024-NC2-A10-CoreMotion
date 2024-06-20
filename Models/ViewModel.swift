//
//  ViewModel.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Lyosha's MacBook   on 6/19/24.
//

import Foundation
import CoreMotion


enum DripSessionStatus{
    case preparing
    case ongoing
    case pause
    case complete
    var getDaga: String{
        switch self{
        case .preparing :
            return "준비중"
        case .ongoing :
            return "진행중"
        case .pause :
            return "일시정지"
        case .complete:
            return "완료"
        }
    }
}

struct DripSessionModel {
    var Dripper: String = ""
    var beanAmount: Int = 1
    var pourTimeSums: [Double] = []
    var waterQuantities: [Int] = []
    var elapsedTimes: [Double] = []
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
    @Published var elapsedTime: Double = 0.0
    @Published var dripSessionModel = DripSessionModel()
    @Published var status: DripSessionStatus = .preparing
    private var predictManager = PredictManager()
    private var motionManager = CMMotionManager()
    private var timer: Timer?
    
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
                self.elapsedTime += 1/2
            }
        }
    }
    
    
    
    func recordPourTime(waterQuantity: Int){
        self.dripSessionModel.waterQuantities.append(waterQuantity)
        self.dripSessionModel.pourTimeSums.append(self.pourTimeSum)
        self.dripSessionModel.elapsedTimes.append(self.elapsedTime)
        self.pourTimeSum = 0.0
        self.elapsedTime = 0.0
    }
    
    func pauseDripSession() {
        self.status = .pause
        self.stopRecordingDeviceMotion()
        timer?.invalidate()
        timer = nil
    }
    
    func resumeDripSession(){
        self.status = .ongoing
        self.startRecordingDeviceMotion()
        self.startDripSession()
    }
    
    func endDripSession(){
        self.timer?.invalidate()
        self.timer = nil
        self.status = .complete
        self.stopRecordingDeviceMotion()
    }
    
    
    func startRecordingDeviceMotion() {
        // Device motion을 수집 가능한지 확인
        guard self.motionManager.isDeviceMotionAvailable else {
            print("Device motion data is not available")
            return
        }
        
        // 모션 갱신 주기 설정 (100Hz)
        self.motionManager.deviceMotionUpdateInterval = 0.01
        // Device motion 업데이트 받기 시작
        self.motionManager.startDeviceMotionUpdates(to: .main) { (deviceMotion: CMDeviceMotion?, error: Error?) in
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
    
    func resetMotionData(){
        self.motionData = [[0.0, 0.0, 0.0, 0.0, 0.0, 0.0]]
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
    
    
    func stopRecordingDeviceMotion() {
        //        watchToiOSConnector.sendDataToiOS(motionData: viewModel.motionData)
        print("send!")
        motionManager.stopDeviceMotionUpdates()
        self.resetMotionData()
    }
}



