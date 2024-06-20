//
//  _024_NC2_A10_CoreMotionApp.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Hyungeol Lee on 6/15/24.
//

import SwiftUI

@main
struct _024_NC2_A10_CoreMotion_Watch_AppApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.status == .preparing {
                PreparingView(viewModel: viewModel)
            }
            else if viewModel.status == .ongoing {
                DripRootView(viewModel: viewModel)
            }
            else if viewModel.status == .complete {
                DripEndView(viewModel: viewModel)
            }
        }
    }
}

