//
//  DripEndView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Hyungeol Lee on 6/20/24.
//

import SwiftUI

struct DripEndView: View {
    @ObservedObject var viewModel: ViewModel
    let pretendardBold = "Pretendard-Bold"
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(.primaryYellow)
                    .frame(width: 100)
                    .opacity(0.4)
                
                    Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 43)
                    .foregroundColor(.orangeYellow)
            }
            
            Text("\(viewModel.dripSessionModel.waterQuantities.count)차 드립 완료")
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .fontDesign(Font.pretendardBold)
//                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .font(.custom(pretendardBold, size: 23))
                .foregroundColor(.primaryYellow)
        }
    }
}
        


#Preview {
    DripEndView(viewModel: ViewModel())
}
