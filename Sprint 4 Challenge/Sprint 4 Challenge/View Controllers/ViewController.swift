//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lockControl: LockControl!
    @IBOutlet weak var resetLockButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLockButton.tintColor = .white
        resetLockButton.isEnabled = false
    }
    
    @IBAction func resetLockButtonTapped(_ sender: Any) {
        lockControl.reset()
        UIView.animate(withDuration: 2) {
            self.resetLockButton.tintColor = .white
        }
        
        resetLockButton.isEnabled = false
    }
    
    @IBAction func lockControlValueChanged(_ sender: Any) {
            UIView.animate(withDuration: 2) {
                self.resetLockButton.tintColor = .red
            }
            
            resetLockButton.isEnabled = true
    }

}
