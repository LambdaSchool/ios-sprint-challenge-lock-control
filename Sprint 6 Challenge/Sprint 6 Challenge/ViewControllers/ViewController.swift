//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBAction func resetButtonTapped(_ sender: Any) {
        self.padLock.image = UIImage(named: "Locked")
        //resetButton.tintColor = AppearanceHelper.maroonRed
        //resetButton.accessibilityElementsHidden = true
        AppearanceHelper.changeBarItemColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.leftBarButtonItem = nil
        
    }
    @IBOutlet weak var padLock: UIImageView!
    
    @IBAction func updateImage(_ sender: Any) {
        // if CustomControl.value is greater than 80% unlock
        if true {
            self.padLock.image = UIImage(named: "Unlocked")
            UIView.animate(withDuration: 5.0) {
                self.navigationItem.leftBarButtonItem = self.resetButton
                AppearanceHelper.changeBarItemColor()
                //self.resetButton.tintColor = .black
                //self.resetButton.accessibilityElementsHidden = true
            }
        }
    }
    
    
}

