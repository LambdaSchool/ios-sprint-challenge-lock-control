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
        
        imageView.image = UIImage(named: "Locked")
    }
    
    

    
    @IBAction func rangeChanged(_ sender: RangeSlider) {
        
        print("rangeChanged")
        if sender.isLocked {
            print("true")
            imageView.image = UIImage(named: "Locked")
        } else {
            imageView.image = UIImage(named: "Unlocked")
        }
        
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        
        // lock back up
        imageView.image = UIImage(named: "Locked")    // this works perfectly
        rangeSlider.isLocked = true
        
        // move ball to the far left
        rangeSlider.layoutSubviews()
        
    }
    
    
    @IBOutlet var rangeSlider: RangeSlider!
    @IBOutlet var imageView: UIImageView!
    
}
