//
//  Slider.swift
//  Sprint 6 Challenge
//
//  Created by Moses Robinson on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class Slider: UIControl {
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if touchPoint.x > self.bounds.minX + 38 && touchPoint.x < self.bounds.maxX - 38 {
            xPosition = touchPoint.x
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            
            if touchPoint.x >= self.bounds.minX + 38 && touchPoint.x <= self.bounds.maxX - 38 {
                xPosition = touchPoint.x
            }
            
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
            
            if touchPoint.x >= (self.bounds.maxX / 10) * 7 {
            xPosition = self.bounds.maxX - 38
            } else {
            xPosition = self.bounds.minX + 38
            }
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - properties
    
    var xPosition: CGFloat = 0
}
