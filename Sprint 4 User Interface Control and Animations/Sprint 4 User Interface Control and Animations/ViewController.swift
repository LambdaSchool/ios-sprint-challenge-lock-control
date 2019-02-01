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
        
        // Round the corners of the slider track
        sliderTrack.layer.cornerRadius = 20
        
        // Start with locked image
        lockImage.image = UIImage(named: "Locked")
        
    }

    // To change store the gray background color
    @IBOutlet var backgroundView: UIView!
    
    // To switch between locked and unlocked
    @IBOutlet weak var lockImage: UIImageView!
    
    // to change the image and appearance of the reset button
    @IBAction func reset(_ sender: Any) {
        // Blends in with nav bar, but should be an animation that has it fade away
        resetResetButton.tintColor = .red
        // Trigger the reset function in the Custom Control class.
        control.reset()
        // No need for an if-statement
        lockImage.image = UIImage(named: "Locked")
    }
    
    // to store visual properties of the reset button
    @IBOutlet weak var resetResetButton: UIBarButtonItem!
    
    // Custom Control Connections
    
    // access the CustomControl class this way
    @IBOutlet weak var control: CustomControl!
    
    // respond to movements of the thumb key
    @IBAction func sliderLockKey(_ sender: Any) {
        // Complete after fixing/completing CustomControl
    }
    
    @IBOutlet weak var sliderTrack: UIView!
    
    
}

