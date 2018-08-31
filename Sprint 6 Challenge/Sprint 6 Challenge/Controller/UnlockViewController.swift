//
//  UnlockViewController.swift
//  Sprint 6 Challenge
//
//  Created by Lambda-School-Loaner-11 on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class UnlockViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let animator = Animator()
    
    private var interactionController: UIPercentDrivenInteractiveTransition?
    
    @IBOutlet weak var unlockImage: UIImageView!
    
    @IBAction func reset(_ sender: Any) {
        transitioningDelegate = self
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            let location = sender.location(in: unlockImage)
            if location.x < unlockImage.bounds.minX {
                interactionController = UIPercentDrivenInteractiveTransition()
                reset(sender)
            }
        case .changed:
            let translation = sender.translation(in: unlockImage)
            let percentageComplete = fabs(translation.x / unlockImage.bounds.width)
            interactionController?.update(percentageComplete)
        case .ended:
            if sender.velocity(in: unlockImage).x > 0 {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
            interactionController = nil
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
}
