//
//  HorizontalColectionView.swift
//  Less-12SU
//
//  Created by Ruslan Liulka on 19.01.2025.
//

import SwiftUI

struct HorizontalColectionView: View {
    
    //@State var users = DataProviderService.generatedUsers()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]) {
                ForEach(0 ..< 50, id: \.self) { index in
                    SimpleCollectionListCell()
                        .onLongPressGesture {
                            
                        }
                }
            }
            .frame(height: 500)
            .padding()
           
     
        }
        
        Spacer()
    }
}

#Preview {
    HorizontalColectionView()
}
