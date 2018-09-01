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
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
        self.sliderView.addGestureRecognizer(rightSwipe)
        rightSwipe.direction = .right
        
    }
    
    func reset(_ sender: Any)
    {
        sliderView.transform = CGAffineTransform(translationX: sliderBackground.frame.size.width - sliderBackground.frame.size.width, y: 0)
    }
    
    
    func unlock()
    {
        imageView.image = UIImage(named: "Unlocked")
    }
    
    @objc func swipeRight(_ sender: UISwipeGestureRecognizer)
    {
        if (sender.direction == .right)
        {
            print("Swipe Right")
            sliderView.transform = CGAffineTransform(translationX: sliderBackground.frame.size.width - 55, y: 0)
            let location = sender.location(in: sliderBackground)
            if location.x < sliderBackground.bounds.midX
            {
                interactionController = UIPercentDrivenInteractiveTransition()
            }
            
            unlock()
        }
        
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        return interactionController
    }
    
}
    
    
    
    
