//
//  HypnosisViewController.swift
//  Hypnosister
//
//  Created by James Roland on 9/14/15.
//  Copyright (c) 2015 LinkedIn. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
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
    }
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        println("HypnosisViewController loaded its view.")
    }
}
