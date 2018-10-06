//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Jason Modisett on 10/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    // MARK:- Properties & types
    private let sliderView = UIView()
    private let touchView = UIView()
    private var touchViewInitialRect = CGRect()
    private let lockImageView = UIImageView()
    private var lockImage: UIImage {
        return isLocked ? UIImage(named: "Locked")! : UIImage(named: "Unlocked")!
    }
    private var initialXValue: CGFloat = 0
    private var touchViewMinX: CGFloat = 0
    private var touchViewMaxX: CGFloat = 0
    private var currentSliderPercent: CGFloat = 0
    
    // Value changed property
    var isLocked: Bool = true
    
    
    // MARK:- Lifecycle methods
    // Initial layout
    override func layoutSubviews() {
        // Setting control properties
        backgroundColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        layer.masksToBounds = true
        layer.cornerRadius = bounds.size.width / 8
        
        // Creating the slider view
        sliderView.isUserInteractionEnabled = false
        sliderView.backgroundColor = #colorLiteral(red: 0.4980392157, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
        
        let sliderViewRect = CGRect(x: bounds.minX + 8, y: bounds.maxY - 58, width: bounds.size.width - 16, height: 50)
        sliderView.frame = sliderViewRect
        
        sliderView.layer.masksToBounds = true
        sliderView.layer.cornerRadius = sliderView.frame.size.height / 2
        
        addSubview(sliderView)
        
        // Creating the touch view
        touchView.isUserInteractionEnabled = false
        touchView.backgroundColor = .black
        
        touchViewMinX = sliderView.bounds.minX + 4
        touchViewMaxX = sliderView.frame.width - 4
        
        touchViewInitialRect = CGRect(x: touchViewMinX, y: sliderView.bounds.minY + 4, width: sliderView.bounds.height - 8, height: sliderView.bounds.height - 8)
        touchView.frame = touchViewInitialRect
        
        touchView.layer.masksToBounds = true
        touchView.layer.cornerRadius = touchView.bounds.height / 2
        
        sliderView.addSubview(touchView)
        
        // Setting up the image view
        let imageRect = CGRect(x: bounds.minX, y: bounds.minY + 40, width: bounds.width, height: (bounds.height - sliderView.frame.height) - 80)
        lockImageView.frame = imageRect
        
        lockImageView.image = lockImage
        lockImageView.contentMode = .scaleAspectFit
        
        addSubview(lockImageView)
    }
    
    
    // MARK:- Event tracking
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderView)
        
        if touchView.frame.contains(touchPoint) {
            initialXValue = touchPoint.x
            return true
        } else {
            return false
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderView)
        let touchPointX = touchPoint.x - (touchView.frame.width / 2.5)
        
        currentSliderPercent = (touchView.frame.maxX / touchViewMaxX) * 100
        
        if touchView.frame.minX >= touchViewMinX && touchView.frame.maxX <= touchViewMaxX {
            
            touchView.transform = CGAffineTransform(translationX: touchPointX, y: 0)
            return true
            
        } else if touchView.frame.minX < touchViewMinX {
            
            if touchPointX >= touchView.frame.minX {
                touchView.frame = CGRect(x: touchPointX, y: touchView.frame.minY, width: touchView.frame.width, height: touchView.frame.height)
                return true
            } else {
                touchView.frame = touchViewInitialRect
                return false
            }
            
        } else if touchView.frame.maxX > touchViewMaxX {
            
            if touchPointX <= touchView.frame.maxX {
                touchView.frame = CGRect(x: touchPointX, y: touchView.frame.minY, width: touchView.frame.width, height: touchView.frame.height)
                return true
            } else {
                touchView.frame = CGRect(x: touchViewMaxX - touchView.frame.width, y: touchView.frame.minY, width: touchView.frame.width, height: touchView.frame.height)
                return false
            }
            
        } else { return false }
    
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        // I know it's supposed to be 80 but I made my lock kinda small :/
        // And the values are a little under since I'm using the minX value
        if currentSliderPercent >= 70 { unlock() } else { lock() }
        
        super.endTracking(touch, with: event)
        
        guard let touch = touch,
            let event = event else { return }
        
        super.beginTracking(touch, with: event)
    }
    
    
    // MARK:- Custom event handling methods
    private func unlock() {
        
        isLocked = false
        isUserInteractionEnabled = false

        lockImageView.image = lockImage
        
        UIView.animate(withDuration: 0.35,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.8,
                       options: [.allowUserInteraction], animations: {
                        
            self.touchView.frame = CGRect(x: self.touchViewMaxX - self.touchView.frame.width, y: self.touchView.frame.minY, width: self.touchView.frame.width, height: self.touchView.frame.height)
                        
        }, completion: nil)
        
        sendActions(for: [.valueChanged])
        
    }
    
    func lock() {

        isLocked = true
        isUserInteractionEnabled = true
        
        lockImageView.image = lockImage
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.8,
                       options: [.allowUserInteraction], animations: {
                        
                        self.touchView.frame = self.touchViewInitialRect
                        
        }, completion: nil)
        
    }
    
}
