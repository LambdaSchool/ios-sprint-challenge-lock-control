//
//  Lock.swift
//  Sprint 6 Challenge
//
//  Created by Yvette Zhukovsky on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

//@IBDesignable
class Lock: UIControl {

    
    private let touchView = UIView()
    private var firstTouch = CGRect()
    private var lockImage: UIImage {
        return isLocked ? UIImage(named: "Locked")! : UIImage(named: "Unlocked")!
    }
    private let imageView = UIImageView()
    private let slide = UIView()
   
   
    
    
    var isLocked: Bool = true
    
    
    
    override func layoutSubviews() {
        
        backgroundColor = UIColor.gray
        layer.masksToBounds = true
    
        slide.isUserInteractionEnabled = false
        slide.backgroundColor = UIColor.lightGray
        
        let sliderViewRect = CGRect(x: bounds.minX + 6, y: bounds.maxY - 50, width: bounds.size.width - 10, height: 40)
        slide.frame = sliderViewRect
        
        slide.layer.masksToBounds = true
        slide.layer.cornerRadius = slide.frame.size.height / 2
        
        addSubview(slide)
        
        
        touchView.isUserInteractionEnabled = false
        touchView.backgroundColor = .black
        
        touchMinX = slide.bounds.minX + 7
        touchMaxX = slide.frame.width - 7
        
        firstTouch = CGRect(x: touchMinX, y: slide.bounds.minY + 8, width: slide.bounds.height - 6, height: slide.bounds.height - 6)
        touchView.frame = firstTouch
        
        touchView.layer.masksToBounds = true
        touchView.layer.cornerRadius = touchView.bounds.height / 2
        
        slide.addSubview(touchView)
        
        
        let imageRect = CGRect(x: bounds.minX, y: bounds.minY + 30, width: bounds.width, height: (bounds.height - slide.frame.height) - 70)
     imageView.frame = imageRect
        
        imageView.image = lockImage
       imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
    }
    
    
    private func unlock() {
        
        isLocked = false
        isUserInteractionEnabled = false
        imageView.image = lockImage
        
        UIView.animate(withDuration: 0.20,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.9,
                       options: [.allowUserInteraction], animations: {
                        
                        self.touchView.frame = CGRect(x: self.touchMaxX - self.touchView.frame.width, y: self.touchView.frame.minY, width: self.touchView.frame.width, height: self.touchView.frame.height)
                        
        }, completion: nil)
        
        sendActions(for: [.valueChanged])
        
    }
    
    func open() {
        isLocked = true
        isUserInteractionEnabled = true
        
        imageView.image = lockImage
        
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.8,
                       options: [.allowUserInteraction], animations: {
                        
                        self.touchView.frame = self.firstTouch
                        
        }, completion: nil)
         sendActions(for: [.valueChanged])
        
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: slide)
        
        if touchView.frame.contains(touchPoint) {
            startX = touchPoint.x
            return true
        } else {
            return false
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: slide)
        let touchPointX = touchPoint.x - (touchView.frame.width / 4.5)
        
        PercentSlider = (touchView.frame.maxX / touchMaxX) * 100
        
        if touchView.frame.minX >= touchMinX && touchView.frame.maxX <= touchMaxX {
            
            touchView.transform = CGAffineTransform(translationX: touchPointX, y: 0)
            return true
            
        } else if touchView.frame.minX < touchMinX {
            
            if touchPointX >= touchView.frame.minX {
                touchView.frame = CGRect(x: touchPointX, y: touchView.frame.minY, width: touchView.frame.width, height: touchView.frame.height)
                return true
            } else {
                touchView.frame = firstTouch
                return false
            }
            
        } else if touchView.frame.maxX > touchMaxX {
            
            if touchPointX <= touchView.frame.maxX {
                touchView.frame = CGRect(x: touchPointX, y: touchView.frame.minY, width: touchView.frame.width, height: touchView.frame.height)
                return true
            } else {
                touchView.frame = CGRect(x: touchMaxX - touchView.frame.width, y: touchView.frame.minY, width: touchView.frame.width, height: touchView.frame.height)
                return false
            }
            
        } else { return false }
        
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
             if PercentSlider >= 80 { unlock() } else { open() }
        super.endTracking(touch, with: event)
        guard let touch = touch,
            let event = event else { return }
        super.beginTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }

    
   
    private var touchMinX: CGFloat = 0
    private var touchMaxX: CGFloat = 0
    private var PercentSlider: CGFloat = 0
    private var startX: CGFloat = 0
    
    
    
}

    
    



