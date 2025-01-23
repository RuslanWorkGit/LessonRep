//
//  ActorContentView.swift
//  Less-17
//
//  Created by Ruslan Liulka on 23.01.2025.
//

import SwiftUI

struct ActorContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                Text(viewModel.data)
                    .font(.title)
                    .padding()
            }
            
            Button("Reload Data") {
                //Task дозволяє виконати асинхронний код із await прямо в SwiftUI
                Task {
                    await viewModel.loadData()
                }
            }
        }
        .task {
            await viewModel.loadData()
        }
    }
}

#Preview {
    ActorContentView()
}
