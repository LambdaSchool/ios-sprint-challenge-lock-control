//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isUnlocked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        lockControl.slider.layer.cornerRadius = lockControl.slider.frame.height / 2
//        lockControl.layer.cornerRadius = lockControl.frame.height / 2
//        view.addSubview(lockControl)
//        
//        lockControl.controlSlider()
//        lockControl.controlFrame()
    }

    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var lockControl: LockControl!
    
    @IBAction func renderControlFrame(_ lockControl: LockControl) {
        view.backgroundColor = .lightGray
    }
    
    @IBAction func renderControlSlider(_ lockControl: LockControl) {
        view.backgroundColor = .black
    }
    
    @IBAction func toggleLock(_ sender: Any) {
        isUnlocked.toggle()
        
        switch isUnlocked {
        case true:
            let unlocked = "Unlocked"
            lockImageView.image = UIImage(named: unlocked)
        case false:
            let locked = "Locked"
            lockImageView.image = UIImage(named: locked)
        }
    }
}

