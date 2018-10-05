//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lockSwitch(_ lockingControl: LockControl) {
        if lockControl.unlocked {
            resetButton.title = "Reset"
        } else {
            resetButton.title = ""
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        lockControl.reset()
        resetButton.title = ""
    }
    
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    @IBOutlet weak var lockControl: LockControl!
    

}

