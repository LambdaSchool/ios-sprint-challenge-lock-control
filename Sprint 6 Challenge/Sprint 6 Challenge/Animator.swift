//
//  Animator.swift
//  Sprint 6 Challenge
//
//  Created by Jonathan T. Miles on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // destination and source view controls, and the intermediate view (for animation) while we're at it
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? LockedViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        // set container view
        let containerView = transitionContext.containerView
        
        // set up the animated view
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        containerView.addSubview(toView)
        
        // name original elements (to appear animated), unwrapping them
        let sliderFocusSource = fromVC.view.viewWithTag(2)! // this is a UIView of a black square
        let sliderFocusDestination = toVC.view.viewWithTag(2)!
        
        // hide originals
        sliderFocusSource.alpha = 0.0
        sliderFocusDestination.alpha = 0.0
        
        // set up copies of animating content
        // view, color (black), dimensions
        let sliderFocusInitialFrame = containerView.convert(sliderFocusSource.bounds, from: sliderFocusSource)
        let animatedSliderFocus = UIView(frame: sliderFocusInitialFrame)
        animatedSliderFocus.backgroundColor = .black
        containerView.addSubview(animatedSliderFocus)
        
        // set up animation: add elements and handle properties of the transition
        let duration = transitionDuration(using: transitionContext)
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            animatedSliderFocus.frame = containerView.convert(animatedSliderFocus.bounds, from: animatedSliderFocus)
            toView.alpha = 1.0
        }) { (success) in
            // in cleanup restore opacity of original elements
            sliderFocusSource.alpha = 1.0
            sliderFocusDestination.alpha = 1.0
            
            // remove the animated views from container
            animatedSliderFocus.removeFromSuperview()
            
            // complete animation
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
