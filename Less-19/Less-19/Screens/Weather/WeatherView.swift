//
//  WeatherView.swift
//  Less-19
//
//  Created by Ruslan Liulka on 29.01.2025.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            
            TextField("Enter city", text: $viewModel.cityName) {
                Task {
                    await viewModel.fetchWeather(by: viewModel.cityName)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            
            
            Text("City: \(viewModel.cityName)")
                .font(.title)
            
            Text("Temperuture: \(viewModel.temperuture)")
                .font(.headline)
            
            Text("Description: \(viewModel.weatherDescription)")
                .font(.subheadline)
        }
        .task {
            await viewModel.fetchWeather(by: 50.4, by: 30.5)
        }
    }
   
}

#Preview {
    WeatherView()
}
