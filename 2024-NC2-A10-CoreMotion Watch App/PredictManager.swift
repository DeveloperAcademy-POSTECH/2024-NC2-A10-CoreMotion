import Foundation
import CoreML

class PredictManager: ObservableObject {
    @Published var motionClassifier = try? DripMotionClassifier(configuration: .init())
    
    func predict(_ accXs: [Double], _ accYs: [Double], _ accZs: [Double], _ rotXs: [Double], _ rotYs: [Double], _ rotZs: [Double]) -> String {
        let input = DripMotionClassifierInput(
            _0: getLast100motionDataMLArray(accXs),
            _1: getLast100motionDataMLArray(accYs),
            _2: getLast100motionDataMLArray(accZs),
            _3: getLast100motionDataMLArray(rotXs),
            _4: getLast100motionDataMLArray(rotYs),
            _5: getLast100motionDataMLArray(rotZs),
            stateIn: try! MLMultiArray(shape: [400], dataType: .double) // Ensure this shape is correct
        )
        // Log input data
//               print("Input data:")
//               print("accXs:", accXs)
//               print("accYs:", accYs)
//               print("accZs:", accZs)
//               print("rotXs:", rotXs)
//               print("rotYs:", rotYs)
//               print("rotZs:", rotZs)
        do {
            let output = try motionClassifier?.prediction(input: input)
            print("예측값: ", output?.label ?? "모름")
            print("수치 : ", output?.labelProbability ?? "모름")
            return output?.label ?? "측정불가"
        } catch {
            print("Prediction error: \(error)")
            return "측정불가"
        }
    }
    
    func getLastNElements<T>(array: [T], count: Int) -> [T] {
        return Array(array.suffix(count))
    }

    func getLast100motionDataMLArray(_ dataArray: [Double]) -> MLMultiArray {
        let count = min(100, dataArray.count)
        let arr = getLastNElements(array: dataArray, count: count)
        let paddedArray = arr + Array(repeating: 0.0, count: 100 - count)
        let answer = try? MLMultiArray(shape: [100], dataType: .double)
        for (index, element) in paddedArray.enumerated() {
            answer?[index] = NSNumber(value: element)
        }
        return answer!
    }
}
