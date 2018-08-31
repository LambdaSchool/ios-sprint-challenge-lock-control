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
    
    // Lock image on transition
    
    @IBAction func reset(_ sender: Any) {
        transitioningDelegate = self
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var lockImage: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }
    
    // Delegate for presenting
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return animator
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
