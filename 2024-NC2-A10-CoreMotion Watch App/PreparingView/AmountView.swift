//
//  AmountView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct AmountView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var status: PreparingStatus
    @State private var option = 12
    @State private var selectionOption = Array(0...50)
    
    var body: some View {
        
        VStack{
            HStack{
                Text("원두 양")
                    .font(.custom("Pretendard-Bold", size: 23))
                    .padding(.leading, 15)
                    .foregroundColor(.primaryYellow)
                
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
                                    .stroke(.primaryYellow, lineWidth: 2)
                            )
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 127, height: 97)
                .font(.system(size: 24))
                Text("g")
                    .font(.custom("Pretendard-semiBold", size: 32))
                    .foregroundColor(.primaryYellow)
                    .padding(.leading, 5)
                    .padding(.top)
            }
            .padding(.bottom, 10)
            
            Button(
                action:{
                    viewModel.status = .ongoing
                    viewModel.dripSessionModel.beanAmount = option
                    viewModel.startRecordingDeviceMotion()
                    viewModel.startDripSession()
                    print(option)
                }, label : {
                    Text("시작하기")
                        .foregroundColor(.black)
                        .font(.custom("Pretendard-Bold", size: 16))
                })
            .background(Capsule().fill(.lightGreen))
            .padding(.top)
            
        }
    }
}

#Preview {
    AmountView(viewModel: ViewModel(), status: .constant(
        PreparingStatus.amount
    ))
}
