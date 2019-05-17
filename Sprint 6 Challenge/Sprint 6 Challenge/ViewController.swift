//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var customLock: CustomLock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func resetButtonTapped(_ sender: Any) {
        customLock.reset()
    }
    
    @IBAction func customLockTriggered(_ sender: CustomLock) {
        
        if sender.isLocked {
            resetButton.isEnabled = false
            resetButton.tintColor = .clear
        } else {
            resetButton.isEnabled = true
            resetButton.tintColor = AppearanceHelper.navBarTextColor
        }
    }
}

