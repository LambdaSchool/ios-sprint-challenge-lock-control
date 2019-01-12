//
//  UnlockViewController.swift
//  Sprint 6 Challenge
//
//  Created by David Doswell on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class UnlockViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBAction func reset(_ sender: UIButton) {
        transitioningDelegate = self
        dismiss(animated: true, completion: nil)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    private let animator = Animator()
    
    @IBOutlet weak var sliderUnlockImage: UIImageView!
    @IBOutlet weak var resetLock: UIButton!
    @IBOutlet weak var sliderUnlock: CustomControl!
}
