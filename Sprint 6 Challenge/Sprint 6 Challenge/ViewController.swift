//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let shared = ViewController()
    
    @IBOutlet weak var thumbSliderContainer: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lockedUnlockedImage: UIImageView!
    
    var boolean = false {
        didSet {
            if boolean == true {
                lockedUnlockedImage.image = UIImage(named: "Unlocked")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 25
        thumbSliderContainer.layer.cornerRadius = 15
        lockedUnlockedImage.image = UIImage(named: "Locked")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }


}

