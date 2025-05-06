//
//  ContentView.swift
//  Les23-SU
//
//  Created by Ruslan Liulka on 06.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Heelo")
            CircleView()
            CustomDrawingView()
            GradientView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CircleView: View {
    var body: some View {
        Canvas { context, size in
            let radius = min(size.width, size.height) / 2 - 10
            let center = CGPoint(x: size.width / 2, y: size.height / 2)
            let circleRect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
            
            let circlePath = Path(ellipseIn: circleRect)
            
            context.fill(circlePath, with: .color(.teal))
            context.stroke(circlePath, with: .color(.black), lineWidth: 4)
        }
        .frame(width: 200, height: 200)
    }
}

struct CustomDrawingView: View {
    var body: some View {
        Canvas { context, size in
            
            // Малюємо червону пряму лінію
            var linePath = Path()
            linePath.move(to: CGPoint(x: 20, y: 20))
            linePath.addLine(to: CGPoint(x: size.width - 20, y: 20))
            context.stroke(linePath, with: .color(.red), lineWidth: 4)
            
            var curvePath = Path()
            curvePath.move(to: CGPoint(x: 20, y: 50))
            curvePath.addQuadCurve(to: CGPoint(x: size.width - 20, y: 50), control: CGPoint(x: size.width / 2, y: 80))
            context.stroke(curvePath, with: .color(.green), lineWidth: 3)
            
            var trianglePath = Path()
            trianglePath.move(to: CGPoint(x: 50, y: 250))
            trianglePath.addLine(to: CGPoint(x: size.width / 2, y: 100))
            trianglePath.addLine(to: CGPoint(x: size.width - 20, y: 250))
            trianglePath.closeSubpath()
            context.stroke(trianglePath, with: .color(.blue), lineWidth: 3)
            
            
        }
        .frame(width: 300, height: 300)
    }
}

struct GradientView: View {
    var body: some View {
        Canvas { context, size in
            
            let rect = CGRect(x: 10, y: 10, width: size.width - 20, height: size.height - 20)
            
            let gradient = Gradient(colors: [.red, .yellow, .green])
            
            let shading = GraphicsContext.Shading.linearGradient(gradient, startPoint: CGPoint(x: 0, y: 20), endPoint: CGPoint(x: size.width, y: size.height / 2))
            
            context.fill(Path(rect), with: shading)
        }
    }
}
