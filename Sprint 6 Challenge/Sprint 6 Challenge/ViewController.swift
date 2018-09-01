//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var customControl: CustomControl?
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var slideBackground: UIView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    
    private var interactionController: UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
   
    @IBAction func reset(_ sender: Any)
    {
        
        print("tapped")
    }
    
    
    
//    @IBAction func slide(_ sender: UIPanGestureRecognizer)
//    {
//        let translation = sender.translation(in: self.view)
//        if let view = sender.view {
//            view.center = CGPoint(x:view.center.x + translation.x,
//                                  y:view.center.y + translation.y)
//        }
//        sender.setTranslation(CGPoint.zero, in: self.view)
//        
//
//        
//        switch sender.state {
//        case .began:
//            let location = sender.location(in: view)
//            if location.x < view.bounds.midX {
//                interactionController = UIPercentDrivenInteractiveTransition()
//                
//            }
//        case .changed:
//            let translation = sender.translation(in: view)
//            let percentageComplete = fabs(translation.x / view.bounds.width)
//            interactionController?.update(percentageComplete)
//        case .ended:
//            if sender.velocity(in: backgroundView).x > 0 {
//                interactionController?.finish()
//            } else {
//                interactionController?.cancel()
//            }
//            interactionController = nil
//        default:
//            break
//        }
//    }
//    
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return interactionController
//    }
    
//    if recognizer.state == UIGestureRecognizerState.ended {
//    // 1
//    let velocity = recognizer.velocity(in: self.view)
//    let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
//    let slideMultiplier = magnitude / 200
//    print("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
//    
//    // 2
//    let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
//    // 3
//    var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
//    y:recognizer.view!.center.y + (velocity.y * slideFactor))
//    // 4
//    finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
//    finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
//    
//    // 5
//    UIView.animate(withDuration: Double(slideFactor * 2),
//    delay: 0,
//    // 6
//    options: UIViewAnimationOptions.curveEaseOut,
//    animations: {recognizer.view!.center = finalPoint },
//    completion: nil)
//    }
}

