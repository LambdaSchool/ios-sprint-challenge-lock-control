//
//  LockViewController.swift
//  Sprint 6 Challenge
//
//  Created by Lambda-School-Loaner-11 on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let animator = Animator()
    
    @IBOutlet weak var lockImage: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }
    
    // Delegate for presenting
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return animator
    }
}
