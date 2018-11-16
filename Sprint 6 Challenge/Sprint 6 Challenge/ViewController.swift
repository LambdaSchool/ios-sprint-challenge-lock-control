//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lockAnimation: LockAnimation!
    @IBOutlet weak var resetButtonOutlet: UIBarButtonItem!
    
    @IBAction func resetButton(_ sender: Any) {
        resetLock()
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func resetLock() {
        lockAnimation.reset()
        updateViews()
    }
    

    func updateViews() {
        if lockAnimation.isUnlocked {
            UIView.animate(withDuration: 0.5) {
                self.resetButtonOutlet.title = "Reset"
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.resetButtonOutlet.title = ""
            }
        }
    }
    
}

