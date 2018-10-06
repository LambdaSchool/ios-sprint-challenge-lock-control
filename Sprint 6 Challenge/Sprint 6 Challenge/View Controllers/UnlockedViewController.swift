//
//  UnlockedViewController.swift
//  Sprint 6 Challenge
//
//  Created by Scott Bennett on 10/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class UnlockedViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.layoutIfNeeded()

        let lockView = UIView()
        lockView.translatesAutoresizingMaskIntoConstraints = false
        lockView.backgroundColor = .lightGray
        lockView.layer.cornerRadius = 50
        
        view.addSubview(lockView)
        
        let lockCenterYConstraint = NSLayoutConstraint(item: lockView,
                                                       attribute: .centerY,
                                                       relatedBy: .equal,
                                                       toItem: view,
                                                       attribute: .centerY,
                                                       multiplier: 1.0,
                                                       constant: 0)
        
        let lockCenterXConstraint = NSLayoutConstraint(item: lockView,
                                                       attribute: .centerX,
                                                       relatedBy: .equal,
                                                       toItem: view,
                                                       attribute: .centerX,
                                                       multiplier: 1.0,
                                                       constant: 0)
        
        let lockWidthConstraint = NSLayoutConstraint(item: lockView,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: 300)
        
        let lockHeightConstraint = NSLayoutConstraint(item: lockView,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 300)
        
        NSLayoutConstraint.activate([lockCenterYConstraint, lockCenterXConstraint, lockWidthConstraint, lockHeightConstraint])
        
        
        let slideView = UIView()
        slideView.translatesAutoresizingMaskIntoConstraints = false
        slideView.backgroundColor = .gray
        slideView.layer.cornerRadius = 25
        
        view.addSubview(slideView)
        
        let slideBottomConstraint = NSLayoutConstraint(item: slideView,
                                                       attribute: .bottom,
                                                       relatedBy: .equal,
                                                       toItem: lockView,
                                                       attribute: .bottom,
                                                       multiplier: 1.0,
                                                       constant: -10)
        
        let slideCenterXConstraint = NSLayoutConstraint(item: slideView,
                                                        attribute: .centerX,
                                                        relatedBy: .equal,
                                                        toItem: view,
                                                        attribute: .centerX,
                                                        multiplier: 1.0,
                                                        constant: 0)
        
        let slideWidthConstraint = NSLayoutConstraint(item: slideView,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 250)
        
        let slideHeightConstraint = NSLayoutConstraint(item: slideView,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 50)
        
        NSLayoutConstraint.activate([slideBottomConstraint, slideCenterXConstraint, slideWidthConstraint, slideHeightConstraint])
        
        
        let buttonView = UIView()
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = .black
        buttonView.layer.cornerRadius = 20
        
        view.addSubview(buttonView)
        
        let buttonBottomConstraint = NSLayoutConstraint(item: buttonView,
                                                        attribute: .bottom,
                                                        relatedBy: .equal,
                                                        toItem: slideView,
                                                        attribute: .bottom,
                                                        multiplier: 1.0,
                                                        constant: -5)
        
        let buttonCenterXConstraint = NSLayoutConstraint(item: buttonView,
                                                         attribute: .centerX,
                                                         relatedBy: .equal,
                                                         toItem: view,
                                                         attribute: .centerX,
                                                         multiplier: 1.0,
                                                         constant: 100)
        
        let buttonWidthConstraint = NSLayoutConstraint(item: buttonView,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 40)
        
        let buttonHeightConstraint = NSLayoutConstraint(item: buttonView,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40)
        
        NSLayoutConstraint.activate([buttonBottomConstraint, buttonCenterXConstraint, buttonWidthConstraint, buttonHeightConstraint])
        
        let lockedImageView = UIImageView()
        lockedImageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Unlocked")
        lockedImageView.image = image
        view.addSubview(lockedImageView)
        
        let lockedImageCenterYConstraint = NSLayoutConstraint(item: lockedImageView,
                                                              attribute: .centerY,
                                                              relatedBy: .equal,
                                                              toItem: view,
                                                              attribute: .centerY,
                                                              multiplier: 1.0,
                                                              constant: -25)
        
        let lockedImageCenterXConstraint = NSLayoutConstraint(item: lockedImageView,
                                                              attribute: .centerX,
                                                              relatedBy: .equal,
                                                              toItem: view,
                                                              attribute: .centerX,
                                                              multiplier: 1.0,
                                                              constant: 0)
        
        let lockedImageWidthConstraint = NSLayoutConstraint(item: lockedImageView,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: 125)
        
        let lockedImageHeightConstraint = NSLayoutConstraint(item: lockedImageView,
                                                             attribute: .height,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: 150)
        
        NSLayoutConstraint.activate([lockedImageCenterYConstraint, lockedImageCenterXConstraint, lockedImageWidthConstraint,lockedImageHeightConstraint])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
