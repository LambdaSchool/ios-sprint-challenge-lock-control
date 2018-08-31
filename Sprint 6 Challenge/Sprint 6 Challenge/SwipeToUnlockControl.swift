//
//  SwipeToUnlockControl.swift
//  Sprint 6 Challenge
//
//  Created by Samantha Gatt on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SwipeToUnlockControl: UIControl {
    
    // MARK: - Properties
    
    var ovalView: UIView!
    
    
    // MARK: - Override functions
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        // if the touchPoint is within the ovalFrame then sendActions (BUT ovalView is on top of it so it's still not going to work)
//        guard ovalFrame.contains(touchPoint) else {
//            return false
//        }
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
            ovalView = newOvalFrame(for: touchPoint)
            
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
            ovalView = newOvalFrame(for: touchPoint)
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    
    // MARK: - Private Functions
    
    @inline(__always) private func newOvalFrame(for location: CGPoint) -> UIView {
//        let origin = CGPoint(x: ovalFrame.origin.x, y: ovalFrame.origin.y)
        let initialFrame = self.convert(ovalView.bounds, from: ovalView)
        let dx = location.x - initialFrame.origin.x
        
        ovalView.frame.origin.x += dx
        
        return ovalView
    }
}
