//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Carolyn Lea on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl
{
    var backgroundView = UIView()
    var imageView = UIImageView()
    var sliderBackground = UIView()
    var sliderView = UIView()
    private var interactionController: UIPercentDrivenInteractiveTransition?
   
    required init?(coder aCoder: NSCoder)
    {
        super.init(coder: aCoder)
        setUp()
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        addSubview(backgroundView)
        addSubview(imageView)
        
        addSubview(sliderBackground)
        //addSubview(sliderView)
    }
    func setUp()
    {
        backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 307, height: 376))
        backgroundView.backgroundColor = UIColor.orange
        backgroundView.layer.cornerRadius = 12.0
        
        
        imageView = UIImageView(frame: CGRect(x: 33, y: 64, width: 241, height: 214))
        imageView.backgroundColor = UIColor.clear
        imageView.image = UIImage(named: "Locked")
        imageView.contentMode = .scaleAspectFit
        backgroundView.addSubview(imageView)
        
        sliderBackground = UIView(frame: CGRect(x: 8, y: 314, width: 291, height: 54))
        sliderBackground.backgroundColor = UIColor.yellow
        sliderBackground.layer.cornerRadius = sliderBackground.frame.height/2
        backgroundView.addSubview(sliderBackground)
        
        sliderView = UIView(frame: CGRect(x: 8, y: 6, width: 44, height: 44))
        sliderView.backgroundColor = UIColor.blue
        sliderView.layer.cornerRadius = sliderView.frame.height/2
        sliderView.isUserInteractionEnabled = true
        sliderBackground.addSubview(sliderView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.slide(_:)))
        self.sliderView.addGestureRecognizer(panGesture)
        func panGesture(sender: UIPanGestureRecognizer){
            let point = sender.location(in: self)
            let panGesture = sender.view
            panGesture?.center = point
            print(point)
        }
    }
    
    @objc func slide(_ sender: UIPanGestureRecognizer)
    {
//        let translation = sender.translation(in: sliderView)
//        if let view = sender.view
//        {
//            view.center = CGPoint(x:view.center.x + translation.x,
//                                  y:view.center.y + translation.y)
//        }
//        sender.setTranslation(CGPoint.zero, in: sliderView)
        if sender.state == .began || sender.state == .changed
        {
            let point = sender.location(in: sliderBackground)
            
            if let superview = self.superview
            {
                let restrictByPoint : CGFloat = 30.0
                let superBounds = CGRect(x: superview.bounds.origin.x + restrictByPoint, y: superview.bounds.origin.y + restrictByPoint, width: superview.bounds.size.width - 2*restrictByPoint, height: superview.bounds.size.height - 2*restrictByPoint)
                if (superBounds.contains(point))
                {
                    let translation = sender.translation(in: self.superview)
                    sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
                    sender.setTranslation(CGPoint.zero, in: self.superview)
                    
                }
                else
                {
                    return
                    
                }
            }
        }
        
        
        
//        switch sender.state {
//
//        case .began:
//            let location = sender.location(in: sliderBackground)
//            if location.x > sliderBackground.bounds.midX {
//                interactionController = UIPercentDrivenInteractiveTransition()
//            unlock()
//            }
//        case .changed:
//            let translation = sender.translation(in: sliderBackground)
//            let percentageComplete = fabs(translation.x / sliderBackground.bounds.width)
//            interactionController?.update(percentageComplete)
//        case .ended:
//            if sender.velocity(in: sliderBackground).x > 0 {
//                interactionController?.finish()
//            } else {
//                interactionController?.cancel()
//            }
//            interactionController = nil
//        default:
//            break
//        }
    
    }
    
    func unlock()
    {
        imageView.image = UIImage(named: "Unlocked")
    }
//    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
//    {
//        updateValue(at: touch)
//        return true
//    }
//
//    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
//    {
//        let touchPoint = touch.location(in: sliderBackground)
//
//        if bounds.contains(touchPoint)
//        {
//            sendActions(for: [.touchDragInside, .valueChanged])
//            updateValue(at: touch)
//        }
//        else
//        {
//            sendActions(for: .touchDragOutside)
//        }
//        return true
//    }
//
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?)
//    {
//        defer { super.endTracking(touch, with: event) }
//        guard let touch = touch else { return }
//
//        let touchPoint = touch.location(in: sliderBackground)
//
//        if bounds.contains(touchPoint)
//        {
//            sendActions(for: [.touchUpInside, .valueChanged])
//        }
//        else
//        {
//            sendActions(for: .touchUpOutside)
//        }
//    }
//
//    override func cancelTracking(with event: UIEvent?)
//    {
//        sendActions(for: [.touchCancel])
//    }
//
//    func updateValue(at touch: UITouch)
//    {
//        let touchPoint = touch.location(in: sliderBackground)
//        if bounds.contains(touchPoint)
//        {
//            sendActions(for: [.valueChanged])
//            print(touchPoint)
//        }
//        else
//        {
//            sendActions(for: [.valueChanged])
//        }
//    }
    
}
