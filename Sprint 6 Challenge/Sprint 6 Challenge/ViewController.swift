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
        
        guard let button = self.navigationItem.rightBarButtonItems?.first else { return }
        
        button.isEnabled = false

    }
    
    @IBAction func changeButton(_ unlockCustomControl: UnlockCustomControl) {
        guard let button = self.navigationItem.rightBarButtonItems?.first else { return }
        button.isEnabled = false
        
        if unlockCustomControl.percentComplete > 0.8 {
            button.isEnabled = true
            button.tintColor = UIColor.black
            unlockCustomControl.indicator.isUserInteractionEnabled = false
        }
    }
    
    
    
    @IBOutlet weak var unlockCustomControl: UnlockCustomControl!
    
    
    @IBAction func resetLock(_ sender: Any) {
        unlockCustomControl.indicator.isUserInteractionEnabled = true
        unlockCustomControl.lockImageView.image = UIImage(named: "Locked")
        unlockCustomControl.percentComplete = 0.0
        unlockCustomControl.layoutSubviews()
        guard let button = self.navigationItem.rightBarButtonItems?.first else { return }
        button.isEnabled = false
    }
    

    @IBOutlet weak var resetButton: UIBarButtonItem!
    
}

