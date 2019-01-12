//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grayBackground: UIView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
   
    @IBAction func resetButtonTapped(_ sender: Any) {
        self.padLock.image = UIImage(named: "Locked")
        CustomControl.thumb.frame = CGRect(x: 3, y: 6, width: 20, height: 20)
        resetButton.title = ""
        resetButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.title = ""
        resetButton.isEnabled = false

    }

    @IBOutlet weak var padLock: UIImageView!
    @IBAction func updateImage(_ sender: Any) {
        let value = CustomControl.value
        if value >= 180 {
            self.padLock.image = UIImage(named: "Unlocked")
            UIView.animate(withDuration: 3.0) {
                self.resetButton.title = "Reset"
                self.resetButton.isEnabled = true
            }
        }
    }
}

