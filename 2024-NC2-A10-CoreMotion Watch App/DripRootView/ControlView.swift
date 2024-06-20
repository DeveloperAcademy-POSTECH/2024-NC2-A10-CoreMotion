//
//  ControlView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct ControlView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    VStack{
                        RoundedRectangle(cornerRadius: 22)
                            .frame(width: 82, height: 44)
                            .foregroundColor(.endRed)
                            .opacity(0.3)
                        Text("종료")
                            .font(.custom("Pretendard-medium", size: 9))
                    }
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17)
                        .foregroundColor(.endRed)
                        .padding(.bottom, 13)
                }
                ZStack{
                    VStack{
                        RoundedRectangle(cornerRadius: 22)
                            .frame(width: 82, height: 44)
                            .foregroundColor(.primaryYellow)
                            .opacity(0.4)
                        Text("일시정지")
                            .font(.custom("Pretendard-medium", size: 9))
                    }
                    Image(systemName: "pause")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                        .foregroundColor(.primaryYellow)
                        .padding(.bottom, 10)

                }
            }
            Spacer()
                .frame(height: 15)
                
            
            HStack{
                ZStack{
                    VStack{
                        RoundedRectangle(cornerRadius: 22)
                            .frame(width: 82, height: 44)
                            .foregroundColor(.listGray)
                            .opacity(0.3)
                        Text("지난 기록")
                            .font(.custom("Pretendard-medium", size: 9))
                    }
                    Image(systemName: "pencil.line")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.listGray)
                        .padding(.bottom, 12)
                }
                ZStack{
                    VStack{
                        RoundedRectangle(cornerRadius: 22)
                            .frame(width: 82, height: 44)
                            .foregroundColor(.waterBlue)
                            .opacity(0.4)
                        Text("차수")
                            .font(.custom("Pretendard-medium", size: 9))
                    }
                    Image(systemName: "1.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                        .foregroundColor(.waterBlue)
                        .padding(.bottom, 12)
                }
            }
        }
    }
}

#Preview {
    ControlView(viewModel: ViewModel())
}
