//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lockView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var customLock: CustomLock!
    @IBOutlet weak var sliderView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 233 / 255, green: 235 / 255, blue: 135 / 255, alpha: 1.0)
        lockImageView.image = UIImage(named: "Locked")
        setAppearance()

    }

    func setAppearance() {
        
        lockView.layer.cornerRadius = sliderView.frame.width / 2
        customLock.layer.cornerRadius = sliderView.frame.width / 2
        sliderView.layer.cornerRadius = sliderView.frame.width / 2
        
        
    }
    
    

}
