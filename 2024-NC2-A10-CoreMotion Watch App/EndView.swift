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
                    .font(.system(size: 11))
                    .fontWeight(.medium)
                    .padding(.leading, 20)
                Spacer()
//                Image(systemName: "star")
//                    .imageScale(.small)
            }
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 86.5, height: 77)
                        .foregroundStyle(.primaryYellow)
                        .opacity(0.3)
                    VStack{
                        Text("원두 양")
                            .font(.system(size: 9))
                            .fontWeight(.medium)
//                            .foregroundStyle(.primaryYellow)
                            .padding(.trailing, 43)
//                            .padding(.bottom, 1)

                        Text("10g")
                            .font(.system(size: 27))
                            .fontWeight(.semibold)
                            .foregroundStyle(.primaryYellow)
//                            .padding(.top)
                            .padding(.bottom, 8)
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 86.5, height: 77)
                        .foregroundStyle(.lightGreen)
                        .opacity(0.3)
                    
                    Text("비율")
                        .font(.system(size: 9))
                        .fontWeight(.medium)
//                        .foregroundStyle(.lightGreen)
                        .padding(.trailing, 52)
                        .padding(.bottom, 40)
                    
                    Text("1 : 1.15")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundStyle(.lightGreen)
                }
            }
            Spacer()
                .frame(width: 5)

                
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 178, height: 91)
                    .foregroundStyle(.waterBlue)
                    .opacity(0.3)
                VStack{
                    HStack{
                        Text("차수")
                            .font(.system(size: 9))
                            .fontWeight(.medium)
                            .foregroundStyle(.waterBlue)
                            .padding(.leading, 18)
                        Spacer()
                        Text("분사량")
                            .font(.system(size: 9))
                            .fontWeight(.medium)
                            .padding(.trailing, 15)
                        Spacer()
                        Text("분사 시간")
                            .font(.system(size: 9))
                            .fontWeight(.medium)
                            .padding(.trailing, 28)
                    }
                    .padding(.bottom, 5)
                    HStack{
                        Text("1차")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .foregroundStyle(.waterBlue)
                            .padding(.leading, 18)
                        Spacer()
                        Text("100ml")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .padding(.trailing, 1)
                        Spacer()
                        Text("30초")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .padding(.trailing, 35)
                    }
                    .padding(.top, 1)
                    .padding(.bottom, 1)

                    HStack{
                        Text("2차")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .foregroundStyle(.waterBlue)
                            .padding(.leading, 18)
                        Spacer()
                        Text("120ml")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .padding(.trailing, 1)
                        Spacer()
                        Text("80초")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .padding(.trailing, 35)
                    }
                    .padding(.bottom, 1)

                    HStack{
                        Text("3차")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .foregroundStyle(.waterBlue)
                            .padding(.leading, 18)
                        Spacer()
                        Text("80ml")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .padding(.trailing, 6)
                        Spacer()
                        Text("10초")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .padding(.trailing, 36)
                    }
                }
            }
        }
    }
}

#Preview {
    EndView()
}
