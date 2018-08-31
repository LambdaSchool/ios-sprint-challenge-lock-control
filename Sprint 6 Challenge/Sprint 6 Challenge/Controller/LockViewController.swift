//
//  LockViewController.swift
//  Sprint 6 Challenge
//
//  Created by Lambda-School-Loaner-11 on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockViewController: UIViewController, UIViewControllerTransitioningDelegate {

    // Reference
    
    let animator = Animator()
    
    // Transition object
    
    private var interactionController: UIPercentDrivenInteractiveTransition?
    
    // Lock image on transition
    
    @IBAction func reset(_ sender: Any) {
        transitioningDelegate = self
        lockImage.image = lockedImage.image
    }
    
    // Image references
    
    let lockedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Locked")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let unlockedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Unlocked")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    @IBOutlet weak var lockImage: UIImageView!
    
    
    // Track transition state and return values
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            let location = sender.location(in: lockImage)
            if location.x < lockImage.bounds.minX {
                interactionController = UIPercentDrivenInteractiveTransition()
                reset(sender)
            }
            lockImage.image = lockedImage.image
        case .changed:
            let translation = sender.translation(in: lockImage)
            let percentageComplete = fabs(translation.x / lockImage.bounds.width)
            interactionController?.update(percentageComplete)
            lockImage.image = lockedImage.image
        case .ended:
            if sender.velocity(in: lockImage).x > 0 {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
            interactionController = nil
            lockImage.image = unlockedImage.image
        default:
            break
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return animator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactionController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    func setUpViews() {
        
        //        view.addSubview(lockedImage)
        //        view.addSubview(unlockedImage)
        //
        //        lockedImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        lockedImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //        lockedImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 150).isActive = true
        //        lockedImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 150).isActive = true
        //
        //        unlockedImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        unlockedImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //        unlockedImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 150).isActive = true
        //        unlockedImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 150).isActive = true
    }
}
