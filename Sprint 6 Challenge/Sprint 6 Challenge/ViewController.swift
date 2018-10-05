//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK :- Properties

    let lockedImage = UIImage(named: "Locked")!
    let unlockedImage = UIImage(named: "Unlocked")!
    
    @IBOutlet weak var swipeContainerView: UIView!
    
    var isUnlocked: Bool = false
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    // MARK :- Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        swipeContainerView.removeFromSuperview()
        setupLockScreen()
        
    }
    
    private func setupLockScreen(){
        
        let lockImageView = UIImageView()
        lockImageView.image = lockedImage
        
        let containerViewFrame = CGRect(x: 0, y: 0, width: 350, height: 350.0)
        let containerView = UIView(frame: containerViewFrame)
        containerView.center.x = view.center.x
        containerView.center.y = view.center.y
        containerView.backgroundColor = .gray
        
        let imageViewFrame = CGRect(x: 0, y: 0, width: lockedImage.size.width, height: lockedImage.size.height)
        lockImageView.frame = imageViewFrame
        lockImageView.center.x = containerView.frame.width / 2
        lockImageView.layoutIfNeeded()
        
        //setup swipe Container
        swipeContainerView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        
//        let swipeCenterContstraint = NSLayoutConstraint(item: swipeContainerView, attribute: .centerX, relatedBy: .equal, toItem: lockImageView.centerX, attribute: .centerX, multiplier: 1, constant: 0)
        
//        let swipeTopContstraint = NSLayoutConstraint(item: swipeContainerView, attribute: .top, relatedBy: .equal, toItem: lockImageView, attribute: .top, multiplier: 1, constant: 10)
//
//        let swipeWidthConstraint = NSLayoutConstraint(item: swipeContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: lockImageView.bounds.width + 20)
//
//        let swipeHeightConstraint = NSLayoutConstraint(item: swipeContainerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
//        NSLayoutConstraint.activate([swipeTopContstraint, swipeWidthConstraint, swipeHeightConstraint ])
        
        let swipeContainerViewFrame = CGRect(x: 10, y: 300, width: lockImageView.bounds.width + 100, height: 38)
        swipeContainerView.frame = swipeContainerViewFrame
        swipeContainerView.center.x = containerView.frame.width / 2
//        swipeContainerView.center.y = containerView.center.y
        swipeContainerView.layer.cornerRadius = 15
        
        containerView.addSubview(lockImageView)
        containerView.addSubview(swipeContainerView)
        containerView.layer.cornerRadius = 50
        view.addSubview(containerView)
        
    }

    @IBAction func swipedToUnlock(_ sender: Any) {
        
    }
    
    
    
    
    @IBAction func resetLock(_ sender: Any) {
    }
    
}

