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
        
//        lockButton.title = ""
//        lockButton.isEnabled = false
    }

    
    var isLocked: Bool = true
    @IBOutlet weak var lockButton: UIBarButtonItem!
    @IBOutlet weak var image: UIImageView!
    
    
    @IBAction func lock(_ sender: Any) {
        toggleLocked()
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

