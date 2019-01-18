//
//  ViewController.swift
//  Sprint6 Lock Control
//
//  Created by Sergey Osipyan on 1/18/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var resetButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var lockUnlockImage: UIImageView!
    @IBOutlet weak var customViewOutlet: CustomControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customViewOutlet.layer.cornerRadius = 35
        navigationItem.title = "Hello!"
        navigationItem.rightBarButtonItem?.title = ""
        lockUnlockImage.image = UIImage(named: "Locked")
    }
    @IBAction func customViewAction(_ sender: CustomControl) {
        
        
        if CustomControl.value > 210.04 {
            
            UIView.animate(withDuration: 1.0) {
                self.lockUnlockImage.image = UIImage(named: "Unlocked")
                self.resetButtonOutlet.title = "Reset"
                self.resetButtonOutlet.isEnabled = true
            }
        } else {
            
                UIView.animate(withDuration: 0.3) {
                    self.resetButtonOutlet.title = ""
                    self.lockUnlockImage.image = UIImage(named: "Locked")
        }
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        
         UIView.animate(withDuration: 0.3) {
        self.lockUnlockImage.image = UIImage(named: "Locked")
        CustomControl.blackCircle.frame = CGRect(x: 7, y: 7, width: 37, height: 37)
        self.resetButtonOutlet.title = ""
        self.resetButtonOutlet.isEnabled = false
    }
    }
}

