//
//  DripRootView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Lyosha's MacBook   on 6/20/24.
//

import Foundation
import SwiftUI

struct DripRootView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selection = "default"
    
    var body: some View {
        TabView(selection: $selection) {
            ControlView(viewModel: viewModel)
            DripView(viewModel: viewModel)
                .tag("default")
            WaterView(viewModel: viewModel)
        }
    }
}

#Preview {
    DripRootView(viewModel: ViewModel())
}
