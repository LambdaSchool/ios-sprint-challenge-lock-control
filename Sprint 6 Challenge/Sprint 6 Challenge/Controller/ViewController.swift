//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    // Reference
    
    let animator = Animator()
    
    // Transition object
    
    private var interactionController: UIPercentDrivenInteractiveTransition?
    
    // Image references
    
    let lockedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Locked")
        return image
    }()
    
    let unLockedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Unlocked")
        return image
    }()
    
    @IBOutlet weak var lockImage: UIImageView!
    
    // Lock image on transition
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        transitioningDelegate = self
        lockImage.image = lockedImage.image
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("swipe began")
        case .changed:
            print("swiped")
        case .ended:
            print("swipe ended")
            lockImage.image = unLockedImage.image
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}

