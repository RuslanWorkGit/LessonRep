//
//  CircleViewLayer.swift
//  Les23
//
//  Created by Ruslan Liulka on 06.05.2025.
//

import UIKit

class CircleViewLayer: CALayer {
    
    override func draw(in ctx: CGContext) {
        
        //Зберігаєму початковий стан контексту
        ctx.saveGState()
        
        //Налаштовуємо параметри алювання: кольори заливки та обводки, товщини лінії.
        ctx.setFillColor(UIColor.systemTeal.cgColor)
        ctx.setStrokeColor(UIColor.black.cgColor)
        ctx.setLineWidth(3.0)
        
        //Обчислюємо радіус та координати центру, враховуючи відступ в 10 пунктів
        let radius = min(bounds.width, bounds.height) / 2 - 10
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let circleRect = CGRect(x: center.x - radius,
                                y: center.y - radius,
                                width: radius * 2,
                                height: radius * 2)
        
        //Створюємо шлях для кола
        let circlePathc = CGPath(ellipseIn: circleRect, transform: .none)
        
        //Додаємо шлях до контексту
        ctx.addPath(circlePathc)
        
        //Малюємо шлях для кола
        ctx.drawPath(using: .fillStroke)
        
        //Відновлюємо тан контексту
        ctx.restoreGState()
    }
}
