//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // set up reset button
    // make button appear when 80% ?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let button = self.navigationItem.rightBarButtonItems?.first else {return}
        button.isEnabled = false
        button.tintColor = Appearance.michiganBlue
    }

    
    @IBAction func resetLockButton(_ sender: Any) {
        guard let button = self.navigationItem.rightBarButtonItems?.first else {return}
        button.isEnabled = false
        
        lockControl.isUserInteractionEnabled = true
        lockControl.lockImage.image = UIImage(named: "Locked")
        lockControl.percentComplete = 0.0
        lockControl.layoutSubviews()
        
    }
    
    @IBOutlet weak var lockControl: LockControl!
    
    
    @IBAction func updateButton(_ lockControl: LockControl) {
        guard let button = self.navigationItem.rightBarButtonItems?.first else { return}
        button.isEnabled = false
        
        if lockControl.percentComplete > 0.8 {
            button.isEnabled = true
            button.tintColor = Appearance.michiganMaize
            lockControl.isUserInteractionEnabled = false
        } else {
            button.tintColor = Appearance.michiganBlue
        }
    }
    
    
}


