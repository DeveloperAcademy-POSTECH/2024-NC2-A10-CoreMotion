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
                        .foregroundStyle(.primaryYellow)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.leading, 7)
                    Spacer()
                }
                Spacer()
            }
            .padding(.bottom, 13)

            HStack{
                Text("드리퍼 선택")
                    .font(.system(size: 23))
                    .fontWeight(.semibold)
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
                    VStack{
                        Text("Hario")
                            .foregroundStyle(.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("하리오")
                            .foregroundStyle(.black)
                            .font(.caption)
                            .padding(.leading, -30)
                            .padding(.top, -12)
                    }
                }
                Spacer()
                    .frame(width: 6)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 88, height: 88)
                        .foregroundStyle(.lightGreen)
                    VStack{
                        Text("Kalita")
                            .foregroundStyle(.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("칼리타")
                            .foregroundStyle(.black)
                            .font(.caption)
                            .padding(.trailing, 33)
                            .padding(.top, -12)
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
