//
//  ContentView.swift
//  combine-exmaple
//
//  Created by Ruslan Liulka on 15.04.2025.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel = CombineViewModel()
    var body: some View {
        VStack {
            TextField("Enter city", text: $viewModel.serchedText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text(viewModel.writeInfo)
                .padding()
            Text(viewModel.text)
        }
        .onAppear {
            viewModel.useDebounce()
            viewModel.useHandleEvents()
            
            
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
