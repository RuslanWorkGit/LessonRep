//
//  SimpleCollectionListCell.swift
//  Less-12SU
//
//  Created by Ruslan Liulka on 18.01.2025.
//

import SwiftUI

struct SimpleCollectionListCell: View {
    
    //var userModel: RowModel
    
    var body: some View {
        VStack{
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.random())
            Text("0")
            Text("age: ")
            HStack {
                Text("index:")
                Text("")
            }
            Spacer()
            Button {
                print("Button pushed!!!")
            } label: {
                Text("Push me!")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }
        
            
            

            
            
        }
    }
}

#Preview {
    SimpleCollectionListCell()
}

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
