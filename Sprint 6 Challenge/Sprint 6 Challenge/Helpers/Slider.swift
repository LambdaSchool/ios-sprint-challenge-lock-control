//
//  Slider.swift
//  Sprint 6 Challenge
//
//  Created by Victor  on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
import Foundation
import UIKit

//custom control
@IBDesignable class Slider: UIControl {
    
    //fixed starting position
    var xPosition: CGFloat = 0.0
    var xPercentagePosition: CGFloat = 0.0
    
    //function to update the touch location
    func updateValue(for touch: UITouch) {
        let touchPoint = touch.location(in: self)
        xPercentagePosition = touchPoint.x / bounds.width
        xPosition = touchPoint.x
        sendActions(for: .valueChanged)
    }
    
    //tracks user event and updates value
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(for: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    //tracking user event
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
    
    //ends tracking of user event
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
