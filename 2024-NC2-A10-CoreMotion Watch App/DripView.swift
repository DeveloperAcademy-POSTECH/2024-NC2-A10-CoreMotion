//
//  DripView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by Hyungeol Lee on 6/20/24.
//

import SwiftUI

struct DripView: View {
    @State private var isAnimating = false
    let circleRadius: CGFloat = 50 // 큰 원의 반지름
    let smallCircleRadius: CGFloat = 4 // 작은 원의 반지름
    let animationDuration = 2.0
    
    
      var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
          .repeatForever(autoreverses: false)
      }
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(Color.primaryYellow, lineWidth: 2)
                    .foregroundColor(.primaryYellow)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .opacity(0)
                Circle()
                    .foregroundColor(.primaryYellow)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .opacity(0.4)
                Button(
                      action: {
                        self.isAnimating.toggle()
                      },
                      label: {
                Circle()
                    .foregroundColor(.primaryYellow)
                    .frame(width: 8)
//                    .padding(.bottom, 100)
                    .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0))
                    .offset(y: -circleRadius)
                    .animation(self.isAnimating ? foreverAnimation : .default)
                    .rotationEffect(
                    Angle(
                      degrees:  self.isAnimating ? 360 : 0
                      )
                    )
                    .animation(self.isAnimating ? foreverAnimation : .default)
            })
                

                                    
                VStack{
                    Image(systemName: "drop.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 9)
                        .foregroundColor(.orangeYellow)
//                    Button(
//                          action: {
//                            self.isAnimating.toggle()
//                          },
//                          label: {
                              Image(systemName: "mug.fill")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 28)
                                  .padding(.leading, 5)
//                                  .rotationEffect(
//                                  Angle(
//                                    degrees:  self.isAnimating ? 360 : 0
//                                    )
//                                  )
//                                  .animation(self.isAnimating ? foreverAnimation : .default)
//                          })
                }
            }
            

            Text("1차 드립")
                .font(.custom("Pretendard-bold", size: 23))
        }
    }
}
    
#Preview {
    DripView()
}
