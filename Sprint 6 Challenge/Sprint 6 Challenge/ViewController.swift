//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var reset: UIBarButtonItem!
    @IBOutlet weak var lockImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset.isEnabled = false
        reset.tintColor = .clear
    }

   

    @IBAction func changeLockState(_ sender: LockControl) {
        if sender.isUnlocked  {
            animate(lockState: true)
        } else {
            animate(lockState: false)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        animate(lockState: false)

    }
    
    func animate(lockState: Bool) {
        if lockState {
            UIView.animate(withDuration: 0.5) {
                self.lockImageView.image = #imageLiteral(resourceName: "Unlocked")
                self.reset.isEnabled = true
                self.reset.tintColor = .white
                
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.lockImageView.image = #imageLiteral(resourceName: "Locked")
                self.reset.isEnabled = false
                self.reset.tintColor = .clear
            }
        }
    }
}

