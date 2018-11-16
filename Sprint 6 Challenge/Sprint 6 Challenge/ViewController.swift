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
    
    @IBAction func lockValueChanged(_ sender: LockAnimation) {
        updateViews()
    }
    
    
    
    @IBAction func resetButton(_ sender: Any) {
        resetLock()
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func resetLock() {
        lockAnimation.reset()
        updateViews()
    }
    

    func updateViews() {
        print("Updating button")
        print("lock animation is unlocked: \(lockAnimation.isUnlocked)")
        if lockAnimation.isUnlocked {
            UIView.animate(withDuration: 1) {
                self.resetButtonOutlet.isEnabled = true
                self.resetButtonOutlet.tintColor = nil
            }
        } else {
            UIView.animate(withDuration: 2) {
                self.resetButtonOutlet.isEnabled = false
                self.resetButtonOutlet.tintColor = UIColor.clear
            }
        }
    }
    
}

