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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    var resetLock: Bool = false
    
    
    @IBAction func updateLockValue(_ sender: CustomControl) {
        if sender.isLocked == true {
            sender.imageView = UIImageView(image: lockedImage)
        } else {
            sender.imageView = UIImageView(image: unlockedImage)
            AppearanceHelper.changeAlpha()
        }
    }
    
    @IBAction func resetTapped(_ sender: UIBarButtonItem) {
        resetLock = true
    }
    

}

