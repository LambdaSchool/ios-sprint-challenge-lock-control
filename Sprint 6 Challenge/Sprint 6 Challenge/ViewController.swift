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
        
        swipeToUnlockControl.ovalView = ovalView
//        lockButton.title = ""
//        lockButton.isEnabled = false
    }

    
    var isLocked: Bool = true
    @IBOutlet weak var lockButton: UIBarButtonItem!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ovalView: UIView!
    @IBOutlet weak var swipeToUnlockControl: SwipeToUnlockControl!
    
    
    
    @IBAction func lock(_ sender: Any) {
        toggleLocked()
    }
    
    @IBAction func swipe(_ sender: SwipeToUnlockControl) {
        ovalView = sender.ovalView
    }
    
    
    
    func toggleLocked() {
        if self.isLocked {
            self.isLocked = !self.isLocked
            self.image.image = UIImage(named: "Unlocked")
        } else {
            self.isLocked = !self.isLocked
            self.image.image = UIImage(named: "Locked")
        }
    }
}

