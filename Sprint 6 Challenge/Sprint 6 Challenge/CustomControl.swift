//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Ilgar Ilyasov on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    let dot = UIView()
    var image: UIImageView!
    
    // Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createDot()
    }
    
    // Create a dot
    
    func createDot() {
        
        let swipeFrameX = self.frame.origin.x
        let swipeFrameY = self.frame.origin.y
        dot.frame = CGRect(x: swipeFrameX + 10, y: swipeFrameY-130, width: 60, height: 60)
        dot.layer.cornerRadius = 30
        dot.backgroundColor = .black
        dot.isUserInteractionEnabled = true
        
        self.addSubview(dot)
    }

    // Add touch handler
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        updateLocation(at: touch)
        animateImage(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateLocation(at: touch)
            animateImage(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateLocation(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        if self.frame.contains(touchPoint) {
            UIView.animate(withDuration: 0.5) {
                self.dot.transform = CGAffineTransform.init(translationX: touchPoint.x, y: touchPoint.y)
            }
            sendActions(for: .valueChanged)
        }
        return
    }
    
    func unLock() {
        guard let image = image else { return }
        image.image = #imageLiteral(resourceName: "Unlocked")
    }
    
    func reset() {
        guard let image = image else { return }
        dot.frame.origin.x = 0.0
        image.image = #imageLiteral(resourceName: "Locked")
    }
    
    func animateImage(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        // change image and make button visible        
        if touchPoint.x < self.bounds.size.width * 0.8  {
            unLock()
            dot.isUserInteractionEnabled = false
        } else if touchPoint.x > 0.8 {
            reset()
        }
    }
}
