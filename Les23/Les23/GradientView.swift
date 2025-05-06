//
//  GradientView.swift
//  Les23
//
//  Created by Ruslan Liulka on 06.05.2025.
//

import UIKit

class GradientView: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let color: [CGColor] = [
            UIColor.red.cgColor,
            UIColor.blue.cgColor,
            UIColor.yellow.cgColor
        ]
        
        let locations: [CGFloat] = [ 0.0, 0.5, 1.0]
        
        if let gradient = CGGradient(colorsSpace: colorSpace, colors: color as CFArray, locations: locations) {
            let startPoint = CGPoint(x: rect.minX, y: rect.minY)
            let endPoint = CGPoint(x: rect.maxX, y: rect.maxY)
            
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        }
    }


}
