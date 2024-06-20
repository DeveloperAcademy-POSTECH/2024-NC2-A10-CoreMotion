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
    @State private var selection: String = "default"
    
    var body: some View {
        TabView(selection: $selection) {
            ControlView(viewModel: viewModel)
                .tag("controlView")
            DripView(viewModel: viewModel)
                .tag("default")
            WaterView(viewModel: viewModel, selection: $selection)
                .tag("waterView")
        }
    }
}

#Preview {
    DripRootView(viewModel: ViewModel())
}
