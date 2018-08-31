//
//  SwipeToUnlock.swift
//  Sprint 6 Challenge
//
//  Created by De MicheliStefano on 31.08.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable class SwipeToUnlock: UIControl {
    
    var xPosition: CGFloat = 0.0
    
    var xPercentagePosition: CGFloat = 0.0
    
    func updateValue(for touch: UITouch) {
        let touchPoint = touch.location(in: self)
        xPercentagePosition = touchPoint.x / bounds.width
        xPosition = touchPoint.x
        sendActions(for: .valueChanged)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(for: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(for: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}
