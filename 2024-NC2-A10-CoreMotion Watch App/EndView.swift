//
//  EndView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct EndView: View {
    var body: some View {
        VStack{
            HStack{
                Text("2024. 06. 10")
                    .font(.custom("Pretendard-medium", size: 11))
                    .padding(.leading, 20)
                Spacer()
                Text("하리오")
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
                    Text("10g")
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
                    Text("1:1.5")
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
                        Text("1차")
                            .font(.custom("Pretendard-Bold", size: 11))
                            .foregroundStyle(.waterBlue)
                        Text("2차")
                            .font(.custom("Pretendard-Bold", size: 11))
                            .foregroundStyle(.waterBlue)
                        Text("3차")
                            .font(.custom("Pretendard-Bold", size: 11))
                            .foregroundStyle(.waterBlue)
                    }
                    .padding(.leading, 20)
                    Spacer()
                    VStack(alignment: .leading, spacing: 6){
                        Text("분사량")
                            .font(.custom("Pretendard-regular", size: 9))
                        Text("100ml")
                            .font(.custom("Pretendard-Bold", size: 11))
                        Text("120ml")
                            .font(.custom("Pretendard-Bold", size: 11))
                        Text("80ml")
                            .font(.custom("Pretendard-Bold", size: 11))
                    }
                    .padding(.trailing, 6)
                    Spacer()
                    VStack(alignment: .leading, spacing: 6){
                        Text("분사 시간")
                            .font(.custom("Pretendard-regular", size: 9))
                        Text("30초")
                            .font(.custom("Pretendard-Bold", size: 11))
                        Text("40초")
                            .font(.custom("Pretendard-Bold", size: 11))
                        Text("20초")
                            .font(.custom("Pretendard-Bold", size: 11))
                    }
                    .padding(.trailing, 22)
                }
            }
        }
    }
}

#Preview {
    EndView()
}
