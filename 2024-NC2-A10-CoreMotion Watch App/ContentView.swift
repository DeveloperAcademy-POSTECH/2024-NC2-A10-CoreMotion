/* watchOS에서 Core Motion 데이터 수집하기 */
import SwiftUI
import CoreMotion
import CoreML

struct ContentView: View {

    
    @ObservedObject var viewModel: ViewModel
    @StateObject var watchToiOSConnector = WatchToiOSConnector()
    @State var isSessionEnd = false
    
    var body: some View {
        VStack {
//            Text("accX: \(viewModel.accX)")
//            Text("accY: \(viewModel.accY)")
//            Text("accZ: \(viewModel.accZ)")
//            Text("rotX: \(rotX)")
//            Text("rotY: \(rotY)")
//            Text("rotZ: \(rotZ)")
            Text("Prediction: \(viewModel.prediction)")
            Text("PourTime: \(viewModel.pourTimeSum)")
            HStack {
                Button {
                    viewModel.startRecordingDeviceMotion()
                    viewModel.startDripSession()
                    print("Device motion 업데이트 시작!!!")
                
                } label: {
                    Text("Start")
                        .font(.body)
                        .foregroundColor(.green)
                }
                
                Button {
                    viewModel.stopRecordingDeviceMotion()
                    viewModel.endDripSession()
                } label: {
                    Text("Stop")
                        .font(.body)
                        .foregroundColor(.red)
                }
//                Button {
////                    viewModel.prediction = viewModel.predictManager.predict(accXs, accYs, accZs, rotXs, rotYs, rotZs)
//                    print("predict")
//                } label: {
//                    Text("Predict")
//                }
            }
        }
    }
}



#Preview {
    ContentView(viewModel: ViewModel())
}
