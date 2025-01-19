//
//  CollectionView.swift
//  Less-12SU
//
//  Created by Ruslan Liulka on 18.01.2025.
//

import SwiftUI

struct CollectionView: View {
    
    //@State var users = DataProviderService.generatedUsers()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]) {
                ForEach(0 ..< 50, id: \.self) { index in
                    SimpleCollectionListCell()
                        .onLongPressGesture {
                            
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CollectionView()
}
