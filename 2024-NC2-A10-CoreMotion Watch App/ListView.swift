//
//  ListView.swift
//  2024-NC2-A10-CoreMotion Watch App
//
//  Created by jeongonyu on 6/19/24.
//

import SwiftUI

struct ListView: View {
    
    
    var body: some View {
        
        
        VStack{
            HStack{
                Text("지난 기록")
                    .font(.custom("Pretendard-regular", size: 16))
                Spacer()
            }
            Spacer()
                .frame(height: 10)
            ScrollView{
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 12")
                            .font(.custom("Pretendard-semiBold", size: 16))

                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 11")
                            .font(.custom("Pretendard-semiBold", size: 16))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 10")
                            .font(.custom("Pretendard-semiBold", size: 16))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 09")
                            .font(.custom("Pretendard-semiBold", size: 16))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 08")
                            .font(.custom("Pretendard-semiBold", size: 16))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 07")
                            .font(.custom("Pretendard-semiBold", size: 16))
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
