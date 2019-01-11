//
//  Animator.swift
//  Sprint 6 Challenge
//
//  Created by David Doswell on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? UnlockViewController,
            let toView = transitionContext.view(forKey: .to) else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        let unlockViewFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        toView.frame = unlockViewFrame
        toView.alpha = 0
        
        let lock = fromVC.sliderLock!
        let unlock = toVC.sliderUnlock!
        unlock.alpha = 0
        
        let imageInitialFrame = containerView.convert(lock.bounds, from: lock)
        
        let animationImage = UIImageView()
        animationImage.frame = imageInitialFrame
        
        containerView.addSubview(animationImage)
        
        toView.layoutIfNeeded()
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            animationImage.frame = containerView.convert(unlock.bounds, from: unlock)
            toView.alpha = 1
            
        }) { (success) in
            unlock.alpha = 1
            animationImage.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
