//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }
    
    @IBAction func panLock(_ sender: UIPanGestureRecognizer) {
        guard let sliderView = view.viewWithTag(1) else { return }
        
        switch sender.state {
        case .began:
            // get starting location
            let location = sender.location(in: sliderView)
            // determine the point at which the control would be identified as a gesture and not a random touch
            if location.x < sliderView.bounds.midX {
                interactionController = UIPercentDrivenInteractiveTransition()
            }
        case .changed:
            // get the origin coordinate plane for the translation (x-axis)
            let translation = sender.translation(in: sliderView)
            // get the percentage
            let percentageComplete = translation.x / sliderView.bounds.width
            // update the interactionController with the percentage data
            interactionController?.update(percentageComplete)
        case .ended:
            // set conditions for the end of the gesture. For this project, the percentage should be over 80%
            guard let interactController = interactionController else { return }
            if interactController.percentComplete > CGFloat(0.8) {
                interactController.finish()
            } else {
                interactController.cancel()
            }
            interactionController = nil
        default:
            break
        }
    
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
    // MARK: - Properties
    
    let animator = Animator()
    private var interactionController: UIPercentDrivenInteractiveTransition?
    
}

