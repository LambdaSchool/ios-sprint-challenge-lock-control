//
//  Animator.swift
//  Sprint 6 Challenge
//
//  Created by Lambda-School-Loaner-11 on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ImageProviding {
    var image: UIImage! { get }
}

typealias ImageProvidingVC = ImageProviding & UIViewController

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ImageProvidingVC,
            let toVC = transitionContext.viewController(forKey: .to) as? ImageProvidingVC,
            let toView = transitionContext.view(forKey: .to) else {
                return
                
        }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        
    }
    
}
