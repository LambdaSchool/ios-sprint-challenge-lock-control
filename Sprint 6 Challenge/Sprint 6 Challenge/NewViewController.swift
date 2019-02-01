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
        
        if isHidden == true {
            UIBarButtonItem.appearance().tintColor = UIColor.darkGray.withAlphaComponent(0)
        } else {
            UIBarButtonItem.appearance().tintColor = UIColor.darkGray.withAlphaComponent(1)
        }
    }
    var isHidden = true
    
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    
    @IBAction func updateValueImage(_ sender: TrackControl) {
        if sender.value >= 192 {
            lockImageView.image = unlockedImage
            isHidden = false
            UIBarButtonItem.appearance().tintColor = UIColor.darkGray.withAlphaComponent(1)
            self.viewDidLoad()
            
        } else {
            UIBarButtonItem.appearance().tintColor = UIColor.darkGray.withAlphaComponent(0)
            lockImageView.image = lockedImage
            isHidden = true
            self.viewDidLoad()
        }
        print("Value Changed")
    }
    
    
    @IBAction func updateImage(_ sender: TrackControl) {
        print("Value Changed")
    }
    
    
    @IBOutlet weak var lockImageView: UIImageView!
    
    
   // var trackControl = TrackControl()
    
    
    @IBOutlet weak var backgroundView: UIView!

    
    
    
    @IBAction func resetTapped(_ sender: UIBarButtonItem) {
        UIBarButtonItem.appearance().tintColor = UIColor.darkGray.withAlphaComponent(0)
        lockImageView.image = lockedImage
       // trackControl.moveBall()
        
        
    }
    
    
    
}
