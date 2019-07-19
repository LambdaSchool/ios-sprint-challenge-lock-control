//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Kat Milton on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit



@IBDesignable class LockControl: UIControl {
    
    var x: CGFloat = 0
    var minX: CGFloat = 0
    var maxX: CGFloat = 100
    
    func updateX(at touchPoint: CGPoint) {
        let touchX = touchPoint.x
        if touchX <= minX {
            x = minX
        } else if touchX >= maxX {
            x = maxX
        } else {
            x = touchX
        }
    }
    
    // MARK: - Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateX(at: touchPoint)
            sendActions(for: [.valueChanged, .touchDown])
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateX(at: touchPoint)
            sendActions(for: [.valueChanged, .touchDragInside])
        } else {
            updateX(at: touchPoint)
            sendActions(for: [.valueChanged, .touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateX(at: touchPoint)
            sendActions(for: [.valueChanged, .touchDragInside])
        } else {
            updateX(at: touchPoint)
            sendActions(for: [.valueChanged, .touchDragOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}


