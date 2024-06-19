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
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 11")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 10")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 09")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 08")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 184, height: 46)
                            .foregroundColor(.listGray)
                            .opacity(0.2)
                        Text("2024. 06. 07")
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
