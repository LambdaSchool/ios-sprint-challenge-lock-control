//
//  ViewController.swift
//  Sprint 4 User Interface Control and Animations
//
//  Created by Jaspal on 2/1/19.
//  Copyright © 2019 Jaspal Suri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Main View background is gray now
        self.backgroundView.backgroundColor = UIColor.gray
        
//        lockImage.image = CustomControl.lockStateImage
//
//        if CustomControl.thresholdValue >= 8 {
//            resetResetButton.tintColor = .black
        }
        
        
    }

    // To change store the gray background color
    @IBOutlet var backgroundView: UIView!
    
    // To switch between locked and unlocked
    @IBOutlet weak var lockImage: UIImageView!
    
    // to change the image and appearance of the reset button
    @IBAction func reset(_ sender: Any) {
        // CustomControl.reset()
    }
    
    // to store visual properties of the reset button
    @IBOutlet weak var resetResetButton: UIBarButtonItem!
    
    // Custom Control Connections
    
    @IBOutlet weak var control: CustomControl!
    
    @IBAction func sliderLockKey(_ sender: Any) {
        
    }
    
    @IBOutlet weak var sliderTrack: UIView!
    
    
}

