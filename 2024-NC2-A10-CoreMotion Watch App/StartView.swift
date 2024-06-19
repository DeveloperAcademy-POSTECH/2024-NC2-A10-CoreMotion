//
//  StartView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Text("Drip Tracker")
                        .font(.custom("Pretendard-extrabold", size: 17))
                        .foregroundStyle(.primaryYellow)
                        .padding(.leading, 7)
                    Spacer()
                }
                Spacer()
            }
            .padding(.bottom, 13)

            HStack{
                Text("드리퍼 선택")
                    .font(.custom("Pretendard-semibold", size: 15))
                    .padding(.leading, 15)
                Spacer()
            }
            .padding(.bottom, 4)

            HStack{
//                Button(action: {}, label: {
//                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                })
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 88, height: 88)
                        .foregroundStyle(.waterBlue)
                    VStack(alignment: .leading, spacing: -3){
                        Text("Hario")
                            .font(.custom("Pretendard-semibold", size: 28))
                            .foregroundStyle(.black)
                        Text("하리오")
                            .font(.custom("Pretendard-regular", size: 13))
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
                    .frame(width: 6)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 88, height: 88)
                        .foregroundStyle(.lightGreen)
                    VStack(alignment: .leading, spacing: -3){
                        Text("Kalita")
                            .font(.custom("Pretendard-semibold", size: 28))
                            .foregroundStyle(.black)
                        Text("칼리타")
                            .font(.custom("Pretendard-regular", size: 13))
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding(.bottom, 70)
        }
    }
}

#Preview {
    StartView()
}
