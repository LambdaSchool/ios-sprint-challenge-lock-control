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
    
    let lockImageView = UIImageView()
    
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
        
        let swipeContainerViewFrame = CGRect(x: 10, y: 300, width: lockImageView.bounds.width + 100, height: 38)
        swipeContainerView.frame = swipeContainerViewFrame
        swipeContainerView.center.x = containerView.frame.width / 2
        swipeContainerView.layer.cornerRadius = 15
        
        containerView.addSubview(lockImageView)
        containerView.addSubview(swipeContainerView)
        containerView.layer.cornerRadius = 50
        view.addSubview(containerView)
        
    }

    @IBAction func swipedToUnlock(_ swiper: SwipeControl) {
        
        if swiper.trackingBall.frame.maxX == 200 {
            lockImageView.image = unlockedImage
        }
        
    }
    
    
    
    
    @IBAction func resetLock(_ sender: Any) {
    }
    
}

