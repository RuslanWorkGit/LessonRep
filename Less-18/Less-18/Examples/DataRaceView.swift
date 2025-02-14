//
//  DataRace.swift
//  Less-18
//
//  Created by Ruslan Liulka on 13.02.2025.
//

import SwiftUI

struct DataRaceView: View {
    
    @StateObject private var viewModel = DataRaceViewModel()
    
    var body: some View {
        VStack {
            Text("Зміст файлу:")
            ScrollView {
                Text(viewModel.fileContents)
                    .padding()
                    .multilineTextAlignment(.center)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            Spacer()
            
            Button("Записати у файл 1") {
                viewModel.writeToFile()
            }
            .padding()
            Button("Записати у файл 2") {
                viewModel.writeToFile()
            }
            .padding()
            Button("Читати зфайлу") {
                viewModel.readFromFile()
            }
            .padding()
        }
        .padding()
    }

}

#Preview {
    DataRaceView()
}
