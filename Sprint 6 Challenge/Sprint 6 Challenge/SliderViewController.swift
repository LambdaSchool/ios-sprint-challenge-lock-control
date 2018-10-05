//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let unlockSlider = UnlockSlider()

    @IBOutlet weak var lockPhoneView: UIView!
    
    @IBAction func SliderControl(_ unlockSlider: UnlockSlider) {
    
        view.backgroundColor = Appearance.lightGray
    }
    
    private var panController: UIPercentDrivenInteractiveTransition?
    
    @IBAction func panControl(_ panTracker: UIPanGestureRecognizer) {
        
        switch panTracker.state {
            
        case .began:
            
            panController = UIPercentDrivenInteractiveTransition()
            dismiss(animated: true, completion: nil)
            
        case .changed:
            
            let translation = panTracker.translation(in: view)
            
            let percentageComplete = abs(translation.y / view.bounds.height)
            
            panController?.update(percentageComplete)
            
            
            
        case .ended:
            
            let velocity = panTracker.velocity(in: view)
            
            if velocity.y > 100 {
                panController?.finish()
            } else {
                panController?.cancel()
            }
            
            panController = nil
            
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unlockSlider.createSlider()
        
        unlockSlider.backgroundColor = UIColor.gray
        view.addSubview(unlockSlider)
    }
    
    private func themeSlider() {
        
        
        
    }

}

