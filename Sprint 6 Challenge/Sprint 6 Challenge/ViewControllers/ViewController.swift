//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Ivan Caldwell on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var padlockImage: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var controlOutlet: CustomControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.title = ""
        resetButton.isEnabled = false
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        self.padlockImage.image = UIImage(named: "Locked")
        resetButton.title = ""
        resetButton.isEnabled = false
        controlOutlet.reset()
    }
    
    @IBAction func updateImage(_ sender: CustomControl) {
        if !resetButton.isEnabled && controlOutlet.unlockedImage {
            self.padlockImage.image = UIImage(named: "Unlocked")
            UIView.animate(withDuration: 3.0) {
                self.resetButton.title = "Reset"
                self.resetButton.isEnabled = true
                CustomControl.thumbEnable = false
            }
        }
    }
}
