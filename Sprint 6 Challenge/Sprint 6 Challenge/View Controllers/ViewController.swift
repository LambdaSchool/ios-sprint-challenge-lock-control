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
            hideResetButton()
        } else {
            showResetButton()
        }
    }
    
    private func hideResetButton() {
        UIView.animate(withDuration: 0.5) {
            self.resetButton.isEnabled = false
            self.resetButton.tintColor = .clear
        }
    }
    
    private func showResetButton() {
        UIView.animate(withDuration: 0.5) {
            self.resetButton.isEnabled = true
            self.resetButton.tintColor = AppearanceHelper.navBarTextColor
        }
    }
}

