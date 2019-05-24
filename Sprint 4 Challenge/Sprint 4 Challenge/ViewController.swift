//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var resetButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.title = ""
    }

    @IBAction func lockControlValueChanged(_ sender: CustomControl) {
        if customControl.isUnlocked {
            lockImageView.image = UIImage(named: "Unlocked")
            customControl.isUserInteractionEnabled = true
            resetButton.title = "Lock"
            UIView.animate(withDuration: 2.0) {
                self.resetButton.tintColor = UIColor.black.withAlphaComponent(1.0)
            }
            
            navigationItem.title = "Unlocked!"
        }
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        customControl.reset()
        lockImageView.image = UIImage(named: "Locked")
        UIView.animate(withDuration: 2.0) {
            self.resetButton.tintColor = UIColor.black.withAlphaComponent(0)
        }
        navigationItem.title = "Slide to Unlock"
    }
}
