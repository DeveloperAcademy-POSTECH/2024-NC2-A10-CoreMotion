//
//  DripEndView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct DripEndView: View {
    var body: some View {
        
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(.primaryYellow)
                    .frame(width: 100)
                    .opacity(0.4)
                
                    Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 43)
                    .foregroundColor(.orangeYellow)
            }
            
            Text("1차 드립 완료")
                .font(.system(size: 23))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.primaryYellow)
        }
    }
}
        


#Preview {
    DripEndView()
}
