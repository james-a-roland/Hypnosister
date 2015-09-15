//
//  HypnosisViewController.swift
//  Hypnosister
//
//  Created by James Roland on 9/14/15.
//  Copyright (c) 2015 LinkedIn. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
    weak var textLabel : UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "Hypnotize"
        tabBarItem.image = UIImage(named: "Hypno")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let backgroundView = HypnosisView(frame: frame)
        view = backgroundView
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.center = view.center
        label.font = UIFont.systemFontOfSize(24)
        label.textAlignment = .Center
        label.text = "Achieve\nNerdvana"
        label.numberOfLines = 2
        view.addSubview(label)
        textLabel = label
    }
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        println("HypnosisViewController loaded its view.")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseIn, animations: {
//            self.textLabel.alpha = 1.0
//            },
//            completion: nil)
        UIView.animateKeyframesWithDuration(2.0, delay: 0.0, options: nil, animations: { () -> Void in
        
        self.textLabel.alpha = 1
        let thirdOfARotation = CGFloat(2.0 * M_PI / 3.0)
        
        UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/3, animations: { () -> Void in
            let angle = 1.0 * thirdOfARotation
            self.textLabel.transform = CGAffineTransformMakeRotation(angle)
            })
        
        UIView.addKeyframeWithRelativeStartTime(1.0/3.0,
            relativeDuration: 1.0/3.0,
            animations: {
            let angle = 2.0 * thirdOfARotation
            self.textLabel.transform = CGAffineTransformMakeRotation(angle)
            })
        
        UIView.addKeyframeWithRelativeStartTime(1.0/3.0,
            relativeDuration: 1.0/3.0,
            animations: {
            let angle = 3.0 * thirdOfARotation
            self.textLabel.transform = CGAffineTransformMakeRotation(angle)
            })
        
        }, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            textLabel.alpha = 0
    }
}
