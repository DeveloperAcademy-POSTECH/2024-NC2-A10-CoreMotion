//
//  AmountView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/18/24.
//

import SwiftUI

struct AmountView: View {
    
    @State private var option = 12
    @State private var selectionOption = Array(0...50)
    
    var body: some View {
        
        VStack{
            HStack{
                Text("원두 양")
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                    .foregroundColor(.primaryYellow)
                
                Spacer()
            }
//            ZStack{
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
                        .font(.system(size: 32))
                        .fontWeight(.semibold)
                        .foregroundColor(.primaryYellow)
                        .padding(.leading, 5)
                        .padding(.top)
                }
                .padding(.bottom, 10)

//            }
//            .padding(.bottom, 5)


                  
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 156, height: 36)
                    .foregroundColor(.lightGreen)
                Text("완료")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
            .padding(.top)

        }
    }
}

#Preview {
    AmountView()
}
