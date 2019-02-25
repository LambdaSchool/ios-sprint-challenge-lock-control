//
//  LockViewController.swift
//  Sprint 6 Challenge
//
//  Created by Lotanna Igwe-Odunze on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class LockViewController: UIViewController, UnlockDelegate {
   
    //Slide Button Delegate
    func buttonStatus(status: String, sender: SlideUnlock) {
        print(status)
    }
    
    @IBOutlet weak var unlocker: SlideUnlock!
    
    @IBOutlet weak var padlock: UIImageView!
    
    func changeImage() {
        
        guard let unlockimage = UIImage(named: "Unlocked") else { return }
        
        if SlideUnlock().unlocked == true { padlock.image = unlockimage }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        self.unlocker.reset() //Resets the slider
    }
    
    //Set delegate for slide to unlock
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unlocker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
