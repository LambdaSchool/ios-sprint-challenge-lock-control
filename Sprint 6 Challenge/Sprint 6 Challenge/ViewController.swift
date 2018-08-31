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
    let lockControl = LockControl()
    
    func animate(lockState: Bool) {
        if lockState {
            UIView.animate(withDuration: 0.25) {
                self.lockImageView.image = #imageLiteral(resourceName: "Unlocked")
                self.reset.tintColor = UIColor.white.withAlphaComponent(1.0)
                
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                self.lockImageView.image = #imageLiteral(resourceName: "Locked")
                self.reset.tintColor = UIColor.white.withAlphaComponent(0.0)
            }
        }
    }
}

