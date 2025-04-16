//
//  RemoveDuplicate.swift
//  combine-exmaple
//
//  Created by Ruslan Liulka on 16.04.2025.
//

import SwiftUI
import Combine

struct RemoveDuplicate: View {
    
    @State private var results: [String] = []
    @State private var cancelable = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            List(results, id: \.self) { Text($0) }
                .onAppear {
                    ["AB", "AB", "B", "B", "C"].publisher
                        .removeDuplicates()
                        .sink { results.append($0) }
                        .store(in: &cancelable)
                }
        }
    }
}

struct CombineView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Debounce example", destination: ContentView())
                NavigationLink("Remove Duplicates", destination: RemoveDuplicate())
            }
        }
    }
}



#Preview {
    CombineView()
}
