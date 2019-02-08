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
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var customProperties: CustomControl!
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.title = nil
        setProperties()
    }
    @IBAction func customView(_ customControl: CustomControl) {
        print(customControl.valueX)
        if customControl.valueX > 0.80 {
            resetButton.isEnabled = true
            lockImage.image = UIImage(named: "Unlocked")
            resetButton.title = "Reset"
            customControl.valueX = 1.0
        } else {
            customControl.valueX = 0.0
        }
    }

    
    func setProperties(){
        customProperties.backgroundColor = UIColor.gray
        customProperties.layer.cornerRadius = 18
        customProperties.clipsToBounds = true
        
        
    }
}
