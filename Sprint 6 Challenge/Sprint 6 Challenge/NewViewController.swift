//
//  NewViewController.swift
//  Sprint 6 Challenge
//
//  Created by Jocelyn Stuart on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
        
        resetButton.tintColor = UIColor.darkGray.withAlphaComponent(0)
    }
    
  
    
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    
    @IBAction func updateValueImage(_ sender: TrackControl) {
        if sender.value >= 192 {
            lockImageView.image = unlockedImage
            resetButton.tintColor = UIColor.darkGray.withAlphaComponent(1)
            
        } else {
            resetButton.tintColor = UIColor.darkGray.withAlphaComponent(0)
            lockImageView.image = lockedImage
           
        }
        print("Value Changed")
    }
    
    
    @IBAction func updateImage(_ sender: TrackControl) {
        print("Value Changed")
    }
    
    
    @IBOutlet weak var lockImageView: UIImageView!
    
    
   
    
    
    @IBOutlet weak var backgroundView: UIView!

    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    
    
    @IBOutlet weak var trackView: TrackControl!
    
    @IBAction func resetTapped(_ sender: UIBarButtonItem) {
        UIBarButtonItem.appearance().tintColor = UIColor.darkGray.withAlphaComponent(0)
        lockImageView.image = lockedImage
        trackView.ballLabel.center.x = 20
        
    }
    
    
}
