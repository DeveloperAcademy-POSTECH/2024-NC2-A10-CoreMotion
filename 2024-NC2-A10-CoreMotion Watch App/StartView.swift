//
//  StartView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var status: PreparingStatus
    @State private var isActive = false
    
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
            .padding(.bottom, 15)
            
            HStack{
//                NavigationLink(value: status.)
                NavigationLink {
                    AmountView(viewModel: viewModel, status: $status)
                        .onAppear(perform: {
                            viewModel.dripSessionModel.Dripper = "Hario"
                        })
                } label: {
                    HarioItemView()
                }

                Spacer()
                    .frame(width: 6)
                NavigationLink {
                    AmountView(viewModel: viewModel, status: $status)
                        .onAppear(perform: {
                            viewModel.dripSessionModel.Dripper = "Kalita"
                        })
                } label: {
                    KalitaItemView()
                }
            }
            .padding(.bottom, 70)
        }
    }
}


#Preview {
    StartView(viewModel: ViewModel(), status: .constant(
        PreparingStatus.start
    ))
}
