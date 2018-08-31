//
//  SwipeToUnlockControl.swift
//  Sprint 6 Challenge
//
//  Created by Samantha Gatt on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SwipeToUnlockControl: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        setupSubviewCustomControl()
//        print("HELLO WORLD!!!!!", oval)
    }
    
    
    // MARK: - Properties
    
    var ovalFrame: CGRect!
    
    
    // MARK: - Override functions
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        // if the touchPoint is within the ovalFrame then sendActions (BUT ovalView is on top of it so it's still not going to work)
        if ovalFrame.contains(touchPoint) {
            sendActions(for: [.touchDown, .valueChanged])
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
            ovalFrame = newOvalFrame(for: touchPoint)
            
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
            
            ovalFrame = newOvalFrame(for: touchPoint)
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    
    // MARK: - Private Functions
    
    @inline(__always) private func newOvalFrame(for location: CGPoint) -> CGRect {
//        let origin = CGPoint(x: ovalFrame.origin.x, y: ovalFrame.origin.y)
        let dx = location.x - ovalFrame.origin.x
        
        ovalFrame.origin.x += dx
        ovalFrame.origin.y = ovalFrame.origin.y
        
        return ovalFrame
    }
}
