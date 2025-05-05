//
//  CircleView.swift
//  Les23
//
//  Created by Ruslan Liulka on 05.05.2025.
//

import UIKit

class CircleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        //1 - отримуємо графічний контекст(фунеція повертає контекст, в рамках якого зможемо намалювати)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        //2 В рамках графічного контексту використовуємо завжди cgColor
        context.setFillColor(UIColor.systemRed.cgColor)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(4)
        
        //3
        let radius = (min(rect.width, rect.height) / 2) - 10
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        //4
        let circleRect = CGRect(x: center.x - radius,
                                y: center.y - radius,
                                width: radius * 2,
                                height: radius * 2)
        //5
        context.addEllipse(in: circleRect)
        
        context.drawPath(using: .fillStroke)
        
    }
}
