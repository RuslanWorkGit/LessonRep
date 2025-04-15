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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.text)
        }
        .onAppear {
            viewModel.upperCaseText()
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
