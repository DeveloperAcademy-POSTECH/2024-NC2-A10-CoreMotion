//
//  PredictManager.swift
//  2024-NC2-A10-CoreMotion
//
//  Created by Lyosha's MacBook   on 6/19/24.
//

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
            stateIn: try! MLMultiArray(shape: [400], dataType: .double)
        )
        let output = try? motionClassifier?.prediction(input: input)
        return output?.label ?? "측정불가"
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
}
