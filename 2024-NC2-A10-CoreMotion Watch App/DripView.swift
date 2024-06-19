//
//  DripView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct DripView: View {
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(.primaryYellow)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .opacity(0.4)
                VStack{
                    Image(systemName: "drop.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 9)
                        .foregroundColor(.orangeYellow)

                    Image(systemName: "mug.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .padding(.leading, 5)
                }
                Circle()
                    .foregroundColor(.primaryYellow)
                    .frame(width: 8)
                    .padding(.bottom, 100)

            }
            

            Text("1차 드립")
                .font(.system(size: 23))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}
    
#Preview {
    DripView()
}
