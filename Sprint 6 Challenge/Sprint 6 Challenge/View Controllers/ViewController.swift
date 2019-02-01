//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var customControl: CustomControl!
    
    @IBOutlet weak var resetBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set navigation title
        navigationItem.title = "Unlock Me!"
        
        navigationItem.rightBarButtonItem?.tintColor = .clear
        
        // Set locked image
        lockImageView.image = UIImage(named: "Locked")
        
        // Round view corners
        mainView.layer.cornerRadius = 30
        sliderView.layer.cornerRadius = 25
        
        
    }


    @IBAction func customControlAction(_ sender: CustomControl) {
        
        if customControl.isUnlocked == true {
            
            navigationItem.rightBarButtonItem?.tintColor = .grayishColor
            
            lockImageView.image = UIImage(named: "Unlocked")
            
            // Disable user interaction once unlocked
            customControl.isUserInteractionEnabled = false
        }
        
        
    }
    
    
    @IBAction func resetBarButtonItemPressed(_ sender: UIBarButtonItem) {
        
        // When reset is tapped, button disappears
        resetBarButtonItem.tintColor = UIColor.clear
        
        // Value of slider goes back to 0
        customControl.reset()
        
        // Image changes to locked image
        lockImageView.image = UIImage(named: "Locked")
    }
    
    
}

