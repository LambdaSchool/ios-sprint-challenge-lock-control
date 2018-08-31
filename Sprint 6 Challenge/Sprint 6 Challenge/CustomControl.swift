//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Lisa Sampson on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            slider.frame = newSliderPosition(for: touchPoint)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            slider.frame = newSliderPosition(for: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func newSliderPosition(for location: CGPoint) -> CGRect {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dx = location.x - center.x
        let frame = slider.frame
        
        return frame
    }
    
    var slider: UIView!
    
}
