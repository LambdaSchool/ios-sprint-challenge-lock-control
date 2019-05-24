//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rightBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
    }

    @IBAction func unlockSliderControl(_ unLockSlider: LockControl) {
        if (unLockSlider.value > 192) {
            lockImageView.image = UIImage(named: "Unlocked")
            
            rightBarButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action:#selector(self.resetButtonClicked(_:)))
            navigationItem.rightBarButtonItems = [rightBarButton]
        } else {
            springBack()
        }
    }
    
    @objc func resetButtonClicked(_ rightBarButton:UIBarButtonItem) {
        lockImageView.image = UIImage(named: "Locked")
        springBack()
        self.navigationItem.rightBarButtonItem = nil
    }
    
    private func setup() {
        
        view.backgroundColor = AppearanceHelper.navItemBrown
        grayBackgoundView.layer.backgroundColor = AppearanceHelper.barelyBrown.cgColor
        grayBackgoundView.layer.borderWidth = 1.0
        grayBackgoundView.layer.borderColor = AppearanceHelper.navbarBrown.cgColor
        unlockSliderView.layer.backgroundColor = AppearanceHelper.navbarBrown.cgColor
        
        rightBarButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action:#selector(self.resetButtonClicked(_:)))
        
        self.navigationItem.rightBarButtonItem = nil
        
        grayBackgoundView.layer.cornerRadius = 22
    //    unlockSliderView.layer.cornerRadius = 22
        self.navigationItem.title = "Hello!"
    }
    
    func springBack() {
        lockImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: 3.0,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        //  self.label.transform = .identity
        },
                       completion: nil)
    }
    
    @IBOutlet weak var grayBackgoundView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var unlockSliderView: LockControl!
}
