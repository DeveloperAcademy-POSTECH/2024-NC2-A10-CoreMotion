//
//  PreparingView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Lyosha's MacBook   on 6/20/24.
//

import SwiftUI

enum PreparingStatus {
    case start
    case amount
    case ready
}


struct PreparingView: View {
    @ObservedObject var viewModel: ViewModel
    @State var status: PreparingStatus = .start
    
    var body: some View {
        VStack {
            switch status {
            case .start:
                StartView(viewModel: viewModel, status: $status)
            case .amount:
                AmountView(viewModel: viewModel, status: $status)
            case .ready:
                AmountView(viewModel: viewModel, status: $status)
            }
        }
    }
}

#Preview {
    PreparingView(viewModel: ViewModel())
}
