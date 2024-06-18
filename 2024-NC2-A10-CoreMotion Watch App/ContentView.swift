/* watchOS에서 Core Motion 데이터 수집하기 */
import SwiftUI
import CoreMotion
import CoreML

struct ContentView: View {
    @State var accX = 0.0
    @State var accY = 0.0
    @State var accZ = 0.0
    
    @State var rotX = 0.0
    @State var rotY = 0.0
    @State var rotZ = 0.0
    @State var motionData: [[Double]] = [[0.0, 0.0, 0.0, 0.0, 0.0, 0.0]]
    
    @State var accXs = [0.0]
    @State var accYs = [0.0]
    @State var accZs = [0.0]
    @State var rotXs = [0.0]
    @State var rotYs = [0.0]
    @State var rotZs = [0.0]
    @State var prediction = ""
    

    private let motionManager = CMMotionManager()
    @StateObject var watchToiOSConnector = WatchToiOSConnector()
    let motionClassifier = try? DripMotionClassifier(configuration: .init())
    
    var body: some View {
        VStack {
            Text("accX: \(accX)")
            Text("accY: \(accY)")
            Text("accZ: \(accZ)")
//            Text("rotX: \(rotX)")
//            Text("rotY: \(rotY)")
//            Text("rotZ: \(rotZ)")
            Text("Prediction: \(prediction)")
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
                Button {
                    predict()
                    print("predict")
                } label: {
                    Text("Predict")
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
            accXs.append(accX)
            accYs.append(accY)
            accZs.append(accZ)
            rotXs.append(rotX)
            rotYs.append(rotY)
            rotZs.append(rotZ)
            
//            let input = DripMotionClassifierInput(
//                _0: getLast100motionDataMLArray(accXs),
//                _1: getLast100motionDataMLArray(accYs),
//                _2: getLast100motionDataMLArray(accZs),
//                _3: getLast100motionDataMLArray(rotXs),
//                _4: getLast100motionDataMLArray(rotYs),
//                _5: getLast100motionDataMLArray(rotZs), 
//                stateIn: MLMultiArray()
//            )
//            let output = try? motionClassifier?.prediction(input: input)
//            prediction = output?.label ?? "측정불가"
        }
    }
    func predict() {
        let input = DripMotionClassifierInput(
            _0: getLast100motionDataMLArray(accXs),
            _1: getLast100motionDataMLArray(accYs),
            _2: getLast100motionDataMLArray(accZs),
            _3: getLast100motionDataMLArray(rotXs),
            _4: getLast100motionDataMLArray(rotYs),
            _5: getLast100motionDataMLArray(rotZs),
            stateIn: MLMultiArray()
        )
        let output = try? motionClassifier?.prediction(input: input)
        prediction = output?.label ?? "측정불가"
    }
    
    func getLastNElements<T>(array: [T], count: Int) -> [T] {
        return Array(array.suffix(count))
    }

    func getLast100motionDataMLArray(_ dataArray : [Double]) -> MLMultiArray {
        var arr: [Double]
        if dataArray.count < 100 {
            arr = dataArray
        }
        
        arr = getLastNElements(array: dataArray, count: 100)
        let answer = try? MLMultiArray(arr)
        return answer!
    }
    
    func stopRecordingDeviceMotion() {
        watchToiOSConnector.sendDataToiOS(motionData: motionData)
        print("send!")
        motionData = [[0.0, 0.0, 0.0, 0.0, 0.0, 0.0]]
        motionManager.stopDeviceMotionUpdates()
        
    }
}


#Preview {
    ContentView()
}
