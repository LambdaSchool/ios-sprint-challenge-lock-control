//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Nathanael Youngren on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    var value: CGFloat = 0
    var minValue: CGFloat = 0
    var maxValue: CGFloat = 80
    
    private func createValue(touchPoint: CGPoint) {
        let touchX = touchPoint.x
        
        if touchX <= minValue {
            value = minValue
        } else if touchX >= maxValue {
            value = maxValue
        } else {
            value = touchX
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            createValue(touchPoint: touchPoint)
            sendActions(for: [.valueChanged, .touchDown])
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            createValue(touchPoint: touchPoint)
            sendActions(for: [.valueChanged, .touchDragInside])
        } else {
            sendActions(for: [.valueChanged, .touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            createValue(touchPoint: touchPoint)
            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: [.valueChanged, .touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}
