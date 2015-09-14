//
//  MiniMapView.swift
//  Hypnosister
//
//  Created by James Roland on 9/14/15.
//  Copyright (c) 2015 LinkedIn. All rights reserved.
//

import UIKit

class MiniMapView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let bounds = self.bounds
        
        let x = bounds.width * relativeX
        let y = bounds.height * relativeY
        let width = bounds.width * relativeWidth
        let height = bounds.height * relativeHeight
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: x, y: y))
        path.addLineToPoint(CGPoint(x: x+width, y: y))
        path.addLineToPoint(CGPoint(x: x+width, y: y+height))
        path.addLineToPoint(CGPoint(x: x, y: y+height))
        
        UIColor.grayColor().colorWithAlphaComponent(0.8).setFill()
        path.fill()
    }
    
    func updateWithScrollView(sv: UIScrollView) {
        relativeX = sv.contentOffset.x / sv.contentSize.width
        relativeY = sv.contentOffset.y / sv.contentSize.height
        relativeWidth = sv.bounds.width / sv.contentSize.width
        relativeHeight = sv.bounds.height / sv.contentSize.height
    }
    
    var relativeX: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var relativeY: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var relativeWidth: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var relativeHeight: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
}
