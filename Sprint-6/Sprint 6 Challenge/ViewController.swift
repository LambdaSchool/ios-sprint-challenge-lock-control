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
        guard let button = resetButton else {return}
        button.isEnabled = true
        button.tintColor = .white
    }

    @IBOutlet weak var lockControl: LockControl!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    @IBAction func resetLock(_ lockButton: LockControl) {
        lockControl.resetSlider()
            guard let button = self.resetButton else {return}
            
            if self.lockControl.isUnLocked == true {
                button.isEnabled = true
                button.tintColor = .white
                self.lockControl.isUserInteractionEnabled = false
            } else {
                button.tintColor = AppearanceHelper.lambdaRed
        }
    }
    
}

