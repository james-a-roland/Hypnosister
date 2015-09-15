//
//  ReminderViewController.swift
//  Hypnosister
//
//  Created by James Roland on 9/15/15.
//  Copyright (c) 2015 LinkedIn. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func addReminder(sender: AnyObject) {
        let date = datePicker.date
        println("setting a reminder for \(date)")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "Reminder"
        tabBarItem.image = UIImage(named: "Time")
    }
    
    convenience init() {
        self.init(nibName: "ReminderViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
