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
        
        setupView()
    }

    func setupView() {
        outsideView.layer.cornerRadius = 20
        customSliderView.layer.cornerRadius = 10
        if let button = self.navigationItem.rightBarButtonItem {
            button.isEnabled = false
            button.tintColor = UIColor.clear
        imageView.image = UIImage(named: "Locked")
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            self.setupView()
        
        }
    }
    
    
    @IBAction func sliderValueChanged(_ sender: CustomControl) {
        if sender.lowerValue >= 0.9 {
            UIView.animate(withDuration: 0.50) {
                self.imageView.image = UIImage(named: "Unlocked")
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                self.navigationItem.rightBarButtonItem?.tintColor = AppearanceHelper.specialGreen
            }
        } else {
            imageView.image = UIImage(named: "Locked")
        }
    }
    
    
    @IBOutlet weak var customSliderView: UIView!
    @IBOutlet weak var outsideView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    
}
