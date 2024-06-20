//
//  EndView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct EndView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text(Date().formatted(.iso8601.year().month().day()))
                    .font(.custom("Pretendard-medium", size: 11))
                    .padding(.leading, 20)
                Spacer()
                Text("\(viewModel.dripSessionModel.Dripper)")
                    .font(.custom("Pretendard-Bold", size: 11))
                    .fontWeight(.medium)
                    .padding(.trailing, 20)
                    .foregroundColor(.waterBlue)
            }
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 86.5, height: 77)
                        .foregroundStyle(.primaryYellow)
                        .opacity(0.3)
                    Text("원두 양")
                            .font(.custom("Pretendard-medium", size: 9))
                            .padding(.trailing, 43)
                            .padding(.bottom, 45)
                    Text("\(viewModel.dripSessionModel.beanAmount)g")
                            .font(.custom("Pretendard-semibold", size: 25))
                            .foregroundStyle(.primaryYellow)
                            .padding(.top, 3)
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 86.5, height: 77)
                        .foregroundStyle(.lightGreen)
                        .opacity(0.3)
                    Text("비율")
                        .font(.custom("Pretendard-medium", size: 9))
                        .padding(.trailing, 52)
                        .padding(.bottom, 45)
                    Text("1:\(viewModel.dripSessionModel.waterQuantities.reduce(0, +)/viewModel.dripSessionModel.beanAmount)")
                        .font(.custom("Pretendard-semibold", size: 25))
                        .foregroundStyle(.lightGreen)
                        .padding(.top, 3)
                }
            }
            Spacer()
                .frame(width: 5)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 178, height: 91)
                    .foregroundStyle(.waterBlue)
                    .opacity(0.3)
                HStack{
                    VStack(alignment: .leading, spacing: 6){
                        Text("차수")
                            .font(.custom("Pretendard-regular", size: 9))
                            .foregroundStyle(.waterBlue)

                            ForEach(Array(viewModel.dripSessionModel.waterQuantities.enumerated()), id: \.1) {(i, _) in
                                Text("\(i+1)차")
                                    .font(.custom("Pretendard-Bold", size: 11))
                                    .foregroundStyle(.waterBlue)
                            }
                    }
                    .padding(.leading, 20)
                    Spacer()
                    VStack(alignment: .leading, spacing: 6){
                        Text("분사량")
                            .font(.custom("Pretendard-regular", size: 9))

                            ForEach(Array(viewModel.dripSessionModel.waterQuantities.enumerated()), id: \.1) {(_, quantity) in
                                Text("\(quantity)ml")
                                    .font(.custom("Pretendard-Bold", size: 11))
                                    .foregroundStyle(.waterBlue)
                            }
                    }
                    .padding(.trailing, 6)
                    Spacer()
                    VStack(alignment: .leading, spacing: 6){
                        Text("분사 시간")
                            .font(.custom("Pretendard-regular", size: 9))

                            ForEach(Array(viewModel.dripSessionModel.pourTimeSums.enumerated()), id: \.1) {(i, pourTimeSum) in
                                Text("\(pourTimeSum)초")
                                    .font(.custom("Pretendard-Bold", size: 11))
                                    .foregroundStyle(.waterBlue)
                            }
                    }
                    .padding(.trailing, 22)
                }
            }
        }
    }
}

#Preview {
    EndView(viewModel: ViewModel())
}
