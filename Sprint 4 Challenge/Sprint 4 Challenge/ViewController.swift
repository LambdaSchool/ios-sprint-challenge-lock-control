//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    @IBOutlet weak var lockView: UIView!
    @IBOutlet weak var sliderTrackView: LockController!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockImage: UIImageView!
    
    let viewCornerRadius: CGFloat = 40
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startingPosition()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
        reset()
        
    }
    
    @IBAction func sliderUnlocked(_ sender: LockController) {
        
        if sender.lockSliderValue >= 0.80 {
            
            sender.lockSliderValue = 1
            sliderTrackView.isEnabled = false
            unlock()
            
            
        }
    }
    
    
    //Functions
    func startingPosition() {
        title = "Locked"
        
        lockImage.image = UIImage(named: "Locked")
        lockImage.layer.cornerRadius = viewCornerRadius
        
        lockView.layer.cornerRadius = viewCornerRadius
        
        sliderTrackView.layer.cornerRadius = viewCornerRadius / 2
        
        resetButton.tintColor = .clear
    }
    
    
    func unlock() {
        
        title = "Unlocked!"
        
        lockImage.image = UIImage(named: "Unlocked")
        
        resetButton.tintColor = .red
        
        
    }
    
    
    func reset() {
        
        sliderTrackView.reset()
        sliderTrackView.isEnabled = true
        sliderTrackView.isEnabled = true
        
        lockImage.image = UIImage(named: "Locked")
        
        resetButton.tintColor = .clear
        
    }
}
