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
        
        
        
        //self.navigationItem.rightBarButtonItem = rightBarButton

        
        setup()
        
    }

    @IBAction func unlockSliderControl(_ unLockSlider: LockControl) {
        if (unLockSlider.value > 192) {
            lockImageView.image = UIImage(named: "Unlocked")
            
            rightBarButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action:#selector(self.resetButtonClicked(_:)))
            navigationItem.rightBarButtonItems = [rightBarButton]
        } else {

        }
    }
    
    @objc func resetButtonClicked(_ rightBarButton:UIBarButtonItem) {
        lockImageView.image = UIImage(named: "Locked")
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
    
    private func setup() {
        
        rightBarButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action:#selector(self.resetButtonClicked(_:)))
        
        self.navigationItem.rightBarButtonItem = nil
        
        grayBackgoundView.layer.cornerRadius = 22
    //    unlockSliderView.layer.cornerRadius = 22
        self.navigationItem.title = "Hello!"
    }
    
//    @objc func springButtonTapped() {
//        label.center = self.view.center
//        self.label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
//        UIView.animate(withDuration: 3.0,
//                       delay: 0,
//                       usingSpringWithDamping: 0.3,
//                       initialSpringVelocity: 0,
//                       options: [],
//                       animations: {
//                        self.label.transform = .identity
//        },
//                       completion: nil)
//    }
    
    
    @IBOutlet weak var grayBackgoundView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var unlockSliderView: LockControl!
}
