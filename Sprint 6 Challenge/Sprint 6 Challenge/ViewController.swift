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
        self.resetButton.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lockSwitch(_ lockingControl: LockControl) {
        UIView.animate(withDuration: 1) {
            if self.lockControl.unlocked {
                self.resetButton.title = "Reset"
            } else {
                self.resetButton.title = ""
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        lockControl.reset()
        resetButton.title = ""
    }
    
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    @IBOutlet weak var lockControl: LockControl!
    

}

