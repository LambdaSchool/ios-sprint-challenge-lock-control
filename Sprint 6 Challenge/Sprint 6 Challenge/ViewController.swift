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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        animate()
    }
    let lockControl = LockControl()
    
    func animate() {
        if !lockControl.isUnlocked {
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

