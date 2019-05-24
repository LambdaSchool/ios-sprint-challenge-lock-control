//
//  CustomLock.swift
//  Sprint 4 Challenge
//
//  Created by Kobe McKee on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomLock: UIControl {
    
    var xValue = 0
    var minX = 0
    var maxX = 200
    
    func updateX(at touchPoint: CGPoint) {
        let touchX = Int(touchPoint.x)
        if touchX <= minX {
            xValue = minX
        } else if touchX >= maxX {
            xValue = maxX
        } else {
            xValue = touchX
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateX(at: touchPoint)
            sendActions(for: [.valueChanged])
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
