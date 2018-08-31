//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Jeremy Taylor on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    var isUnlocked = true
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
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
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}
