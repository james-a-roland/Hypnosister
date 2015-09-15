//
//  HypnosisView.swift
//  Hypnosister
//
//  Created by James Roland on 9/14/15.
//  Copyright (c) 2015 LinkedIn. All rights reserved.
//

import UIKit

class HypnosisView : UIView {
    
    var radiusOffset: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var timer: NSTimer?
    
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
            path.addArcWithCenter(center, radius: radius+radiusOffset, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            path.lineWidth = 10
            
            let alpha = ((radius + radiusOffset - 10) / maxRadius)
            UIColor.purpleColor().colorWithAlphaComponent(alpha).setStroke()
            
            path.stroke()
        }
    }
    
    override func didMoveToSuperview() {
        if superview != nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0/30.0, target: self, selector: "timerFired:", userInfo: nil, repeats: true)
        }
    }
    
    override func removeFromSuperview() {
        timer?.invalidate()
        timer = nil
    }
    
    func timerFired(timer: NSTimer) {
        radiusOffset += 1.0
        
        if radiusOffset > 20 {
            radiusOffset = 0
        }
    }
}
