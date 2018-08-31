//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Jeremy Taylor on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    var isUnlocked = false
    var progress: Float = 0.0
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if isUnlocked {
            reset()
        } else {
            updateValue(at: touch)
            sendActions(for: .touchDown)
            return true
            
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        if !isUnlocked {
            let touchPoint = touch.location(in: self)
            let x = touchPoint.x
            progress = Float(min(x/self.bounds.size.width, 1))
            print(progress)
            if progress >= 0.80 {
                isUnlocked = true
                sendActions(for: .valueChanged)
                touch.view?.isUserInteractionEnabled = false
            
            }
        }
        
    }
    
    func reset() {
        
        progress = 0.0
        isUnlocked = false
    }
    
}
