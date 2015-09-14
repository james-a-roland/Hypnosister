//
//  HypnosisView.swift
//  Hypnosister
//
//  Created by James Roland on 9/14/15.
//  Copyright (c) 2015 LinkedIn. All rights reserved.
//

import UIKit

class HypnosisView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let bounds = self.bounds
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let maxRadius = CGFloat(hypot(CDouble(bounds.width), CDouble(bounds.height)) / 2.0)
        
        //Draw circles until the radius is larger than the max radius
        for var radius: CGFloat = 0.0; radius < maxRadius; radius += 20 {
            
            let path = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            path.lineWidth = 10
            UIColor.purpleColor().setStroke()
            
            path.stroke()
        }
    }
}
