//
//  Animator.swift
//  Sprint 6 Challenge
//
//  Created by Lambda-School-Loaner-11 on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
}
