//
//  MainViewController.swift
//  Sprint 6 Challenge
//
//  Created by Scott Bennett on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    // Properties
    
    let unlockedImageView = UIImageView()
    let lockedImageView = UIImageView()
    let slideView = UIView()
    let buttonView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupViews()
        addPanGesture(view: buttonView)
    }
    
    // MARK: - Gesture Methods
    
    func addPanGesture(view: UIView) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(MainViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        
        let buttonView = sender.view!
        
        switch sender.state {
        case .began:
            moveViewWithPan(view: buttonView, sender: sender)
        case .changed:
            if buttonView.frame.origin.x < 5 {
                returnViewToOrigin(view: buttonView)
            } else if buttonView.center.x > 225 {
                buttonView.center.x = 225
                buttonView.center.y = 25
            } else {
                moveViewWithPan(view: buttonView, sender: sender)
            }
        case .ended:
            if buttonView.center.x < 225.0 * 0.80 {
                returnViewToOrigin(view: buttonView)
            } else {
                setViewUnlocked(view: buttonView)
                self.unlockedImageView.alpha = 1.0
                self.lockedImageView.alpha = 0.0
                resetButton.title = "Reset"
                resetButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)
                buttonView.gestureRecognizers?.forEach(buttonView.removeGestureRecognizer)
            }            
        default:
            break
        }
    }
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: slideView)
        if buttonView.center.x + translation.x >= 25 {
          buttonView.frame.origin = CGPoint(x: view.frame.origin.x + translation.x, y: view.frame.origin.y)
        }
        sender.setTranslation(CGPoint.zero, in: slideView)
        
    }
    
    func returnViewToOrigin(view: UIView) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.buttonView.frame.origin = CGPoint(x: 5, y: 5)
        })
    }
    
    func setViewUnlocked(view: UIView) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.buttonView.frame.origin = CGPoint(x: 205, y: 5)
        })
    }
    
    @IBAction func reset(_ sender: Any) {
        
        self.resetButton.title = ""
        returnViewToOrigin(view: buttonView)
        self.lockedImageView.alpha = 1.0
        self.unlockedImageView.alpha = 0.0
        addPanGesture(view: buttonView)
    }
    
    // MARK: - Setup Views
    
    func setupViews() {
        
        // Setup lock background
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
        
        // Setup slider background
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
        
        // Setup Button
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = .black
        buttonView.layer.cornerRadius = 20
        
        slideView.addSubview(buttonView)
        
        let buttonBottomConstraint = NSLayoutConstraint(item: buttonView,
                                                        attribute: .bottom,
                                                        relatedBy: .equal,
                                                        toItem: slideView,
                                                        attribute: .bottom,
                                                        multiplier: 1.0,
                                                        constant: -5)
        
        let buttonCenterXConstraint = NSLayoutConstraint(item: buttonView,
                                                         attribute: .leading,
                                                         relatedBy: .equal,
                                                         toItem: slideView,
                                                         attribute: .leading,
                                                         multiplier: 1.0,
                                                         constant: 5)
        
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
        
        // Setup locked image
        lockedImageView.translatesAutoresizingMaskIntoConstraints = false
        let lockedImage = UIImage(named: "Locked")
        lockedImageView.image = lockedImage
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
        
        // Setup unlocked Image
        unlockedImageView.translatesAutoresizingMaskIntoConstraints = false
        let unlockedImage = UIImage(named: "Unlocked")
        unlockedImageView.image = unlockedImage
        unlockedImageView.alpha = 0.0
        view.addSubview(unlockedImageView)
        
        let unlockedImageCenterYConstraint = NSLayoutConstraint(item: unlockedImageView,
                                                                attribute: .centerY,
                                                                relatedBy: .equal,
                                                                toItem: view,
                                                                attribute: .centerY,
                                                                multiplier: 1.0,
                                                                constant: -25)
        
        let unlockedImageCenterXConstraint = NSLayoutConstraint(item: unlockedImageView,
                                                                attribute: .centerX,
                                                                relatedBy: .equal,
                                                                toItem: view,
                                                                attribute: .centerX,
                                                                multiplier: 1.0,
                                                                constant: 0)
        
        let unlockedImageWidthConstraint = NSLayoutConstraint(item: unlockedImageView,
                                                              attribute: .width,
                                                              relatedBy: .equal,
                                                              toItem: nil,
                                                              attribute: .notAnAttribute,
                                                              multiplier: 1.0,
                                                              constant: 125)
        
        let unlockedImageHeightConstraint = NSLayoutConstraint(item: unlockedImageView,
                                                               attribute: .height,
                                                               relatedBy: .equal,
                                                               toItem: nil,
                                                               attribute: .notAnAttribute,
                                                               multiplier: 1.0,
                                                               constant: 150)
        
        NSLayoutConstraint.activate([unlockedImageCenterYConstraint, unlockedImageCenterXConstraint, unlockedImageWidthConstraint,unlockedImageHeightConstraint])
        
    }    
}

