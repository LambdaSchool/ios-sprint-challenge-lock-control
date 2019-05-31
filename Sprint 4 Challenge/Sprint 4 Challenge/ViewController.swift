//
//  ViewController.swift
//  Lock(Sprint 4)
//
//  Created by Jordan Davis on 5/30/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "Locked")
        lockButton.title = ""
        setAppearance()
    }
    
    @IBAction func ballValueChanged(_ sender: CustomControl) {
        if customControl.isUnlocked {
            imageView.image = UIImage(named: "Unlocked")
            customControl.isUserInteractionEnabled = true
            lockButton.title = "Lock"
            navigationItem.title = "Reset"
        }
    }
    
    @IBAction func lock(_ sender: UIBarButtonItem) {
        customControl.reset()
        imageView.image = UIImage(named: "Locked")
        lockButton.title = ""
        navigationItem.title = "Slide to Unlock"
    }
    
    func setAppearance() {
        overallView.layer.cornerRadius = 30
        sliderView.layer.cornerRadius = 20
        overallView.layer.shadowOffset = CGSize.zero
        overallView.layer.shadowRadius = 5
        overallView.layer.shadowColor = UIColor.black.cgColor
        overallView.layer.shadowOpacity = 1
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var overallView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var lockButton: UIBarButtonItem!
    

}

