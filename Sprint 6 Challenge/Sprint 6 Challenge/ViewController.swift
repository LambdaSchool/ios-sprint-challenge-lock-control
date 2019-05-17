//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func resetLock(_ sender: Any) {
        if isLocked == true {
            UIView.animate(withDuration: 2.0) {
                self.reset.tintColor = Appearance.pink.withAlphaComponent(1.0)
                self.lockImageView.image = UIImage(named: "Unlocked")
            }
        } else {
            UIView.animate(withDuration: 2.0) {
                self.reset.tintColor = Appearance.pink.withAlphaComponent(0.0)
                self.lockImageView.image = UIImage(named: "Locked")
            }
        }
        
        isLocked = !isLocked
    }

    var isLocked: Bool = true
    
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var reset: UIBarButtonItem!
    
}

