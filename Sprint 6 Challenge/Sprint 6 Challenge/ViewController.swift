//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var reset: UIBarButtonItem!
    
    @IBAction func customControl(_ sender: Any) {
        if customControl.isUnlocked {
            // reset button invisible
            reset.isEnabled = true
            reset.tintColor = UIColor.white
        } else {
            // reset button visible
            reset.isEnabled = false
            reset.tintColor = UIColor.clear
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        customControl.reset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hello!"
    }
}

