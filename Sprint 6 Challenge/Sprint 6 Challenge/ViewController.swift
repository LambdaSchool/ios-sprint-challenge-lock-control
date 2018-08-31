//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lockImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locked"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value >= 4 {
            title = "Unlocked"
            lockImage.image = #imageLiteral(resourceName: "Unlocked")
            self.view.isUserInteractionEnabled = false
        } else {
            title = "Locked"
            lockImage.image = #imageLiteral(resourceName: "Locked")
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        self.view.isUserInteractionEnabled = true
        
    }
}
