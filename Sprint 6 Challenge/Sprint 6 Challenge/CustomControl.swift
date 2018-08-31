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
        let translation = sender.translation(in: sliderView)
        if let view = sender.view
        {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: sliderView)
        
        if sender.state == UIGestureRecognizerState.ended {
            // 1
            let velocity = sender.velocity(in: sliderBackground)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / (sliderBackground.frame.size.width / 2)
            print("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
            
            // 2
            let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
            // 3
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * slideFactor),
                                     y:sender.view!.center.y + (velocity.y * slideFactor))
            // 4
            finalPoint.x = min(max(finalPoint.x, 0), sliderBackground.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), sliderBackground.bounds.size.height)
            
            // 5
            UIView.animate(withDuration: Double(slideFactor * 2),
                           delay: 0,
                           // 6
                options: UIViewAnimationOptions.curveEaseOut,
                animations: {sender.view!.center = finalPoint },
                completion: nil)
        }
    
    }
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
    {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
    {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint)
        {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        }
        else
        {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?)
    {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint)
        {
            sendActions(for: [.touchUpInside, .valueChanged])
        }
        else
        {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?)
    {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch)
    {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint)
        {
            sendActions(for: [.valueChanged])
            print(touchPoint)
        }
        else
        {
            sendActions(for: [.valueChanged])
        }
    }
    
}
