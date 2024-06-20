//
//  ItemView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Lyosha's MacBook   on 6/20/24.
//

import SwiftUI

struct HarioItemView: View {
    var body: some View {
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
    }
}

#Preview {
    HarioItemView()
}
