/* watchOS에서 Core Motion 데이터 수집하기 */
import SwiftUI
import CoreMotion

struct ContentView: View {
    @State var accX = 0.0
    @State var accY = 0.0
    @State var accZ = 0.0
    
    @State var rotX = 0.0
    @State var rotY = 0.0
    @State var rotZ = 0.0
    
    @State var motionData: [[Double]] = [[0.0, 0.0, 0.0, 0.0, 0.0, 0.0]]
    
    private let motionManager = CMMotionManager()
    @StateObject var watchConnector = WatchToiOSConnector()
    
    var body: some View {
        VStack {
            Text("accX: \(accX)")
            Text("accY: \(accY)")
            Text("accZ: \(accZ)")
            Text("rotX: \(rotX)")
            Text("rotY: \(rotY)")
            Text("rotZ: \(rotZ)")

            HStack {
                Button {
                    startRecordingDeviceMotion()
                    print("Device motion 업데이트 시작!!!")
                } label: {
                    Text("Start")
                        .font(.body)
                        .foregroundColor(.green)
                }
                Button {
                    stopRecordingDeviceMotion()
                    print("Device motion 업데이트 종료!!!")
                } label: {
                    Text("Stop")
                        .font(.body)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

extension ContentView {
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
            
            accX = acceleration.x
            accY = acceleration.y
            accZ = acceleration.z
            
            let rotationRate: CMRotationRate = data.rotationRate
            
            rotX = rotationRate.x
            rotY = rotationRate.y
            rotZ = rotationRate.z
            
            motionData.append([accX, accY, accZ, rotX, rotY, rotZ])
            
        }
    }
    
//    func sendDataToiOS( _ motionData: [[Double]]){
////        let data = motionData
//        watchConnector.sendDataToiOS(motionData: motionData)
//    }
    
    func stopRecordingDeviceMotion() {
        
        watchConnector.sendDataToiOS(motionData: motionData)
        print("send!")
//        motionData = [[0.0, 0.0, 0.0, 0.0, 0.0, 0.0]]
        motionManager.stopDeviceMotionUpdates()
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
