//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Andrew Liao on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if lockControl.isLocked && isViewLoaded{
            resetButton.title = ""
            self.title = "Locked"
        }
    }
    @IBAction func unlock(_ lockControl: LockControl) {
            resetButton.title = "Reset"
            self.title = "Unlocked"
    }
    @IBAction func reset(_ sender: Any) {
        lockControl.reset()
    }
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockControl: LockControl!
}
