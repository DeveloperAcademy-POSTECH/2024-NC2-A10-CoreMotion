//
//  KalitaItemView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Lyosha's MacBook   on 6/20/24.
//

import SwiftUI

struct KalitaItemView: View {
    var body: some View {
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
}

#Preview {
    KalitaItemView()
}
