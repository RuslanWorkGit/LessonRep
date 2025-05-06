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
        
        
        
        context.setStrokeColor(UIColor.green.cgColor)
        context.setLineWidth(3.0)
        
        context.move(to: CGPoint(x: 35, y: 35))
        context.addQuadCurve(to: CGPoint(x: rect.width - 20, y: 100),
                             control: CGPoint(x: rect.midX, y: 110))
        context.strokePath()
        
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(4.0)
        
        let points: [CGPoint] = [
            CGPoint(x: rect.midX, y: 120),
            CGPoint(x: rect.midX - 40, y: 180),
            CGPoint(x: rect.midX + 40, y: 180)
        ]
        
        context.addLines(between: points)
        context.closePath()
        context.strokePath()
        
    }
}
