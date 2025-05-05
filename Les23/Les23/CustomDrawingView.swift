//
//  CustomDrawingView.swift
//  Les23
//
//  Created by Ruslan Liulka on 05.05.2025.
//

import UIKit

class CustomDrawingView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        //Line
        context.setStrokeColor(UIColor.purple.cgColor)
        context.setFillColor(UIColor.orange.cgColor)
        context.setLineWidth(3.0)
        
        context.move(to: CGPoint(x: 20, y: 20))
        context.addLine(to: CGPoint(x: rect.width - 20, y: 20))
        context.addLine(to: CGPoint(x: rect.width - 20, y: 60))
        context.closePath()
        //context.strokePath()
        context.drawPath(using: .fillStroke)
    }
}
