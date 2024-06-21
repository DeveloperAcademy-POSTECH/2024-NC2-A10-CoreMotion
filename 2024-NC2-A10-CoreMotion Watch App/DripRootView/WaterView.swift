//
//  WaterView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct WaterView: View {
    @State private var option = 110
    @State private var selectionOption = Array(10...500)
    @ObservedObject var viewModel: ViewModel
    @Binding var selection: String
    
    var body: some View {
        VStack{
            HStack{
                Text("\(viewModel.dripSessionModel.waterQuantities.count+1)차 분사량")
                    .font(.custom("Pretendard-Bold", size: 23))
                    .padding(.leading, 15)
                    .padding(.bottom, -10)
                    .foregroundColor(.waterBlue)
                
                Spacer()
            }
            HStack{
                ZStack{
                    Picker("", selection: $option) {
                        ForEach(0 ..< selectionOption.count) {
                            Text(String(selectionOption[$0]))
                        }
                    }
                    VStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 125, height: 80)
                            .opacity(0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.waterBlue, lineWidth: 2)
                            )
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 127, height: 97)
                .font(.system(size: 24))
                
                Text("ml")
                    .font(.custom("Pretendard-semiBold", size: 32))
                    .foregroundColor(.waterBlue)
                    .padding(.leading, 5)
                    .padding(.top)
            }
            .padding(.bottom)
            
            Button(
                action: {
                    viewModel.recordPourTime(waterQuantity: option)
                    //다시 뷰로 돌아가기
                    selection = "default"
                    
                }, label:{
                    Text("완료")
                        .foregroundColor(.black)
                        .font(.custom("Pretendard-Bold", size: 16))
                })
            .frame(width: 150, height: 50)
            .background(Capsule().fill(.lightGreen))
        }
    }
}

#Preview {
    WaterView(viewModel: ViewModel(), selection: .constant("default"))
}
