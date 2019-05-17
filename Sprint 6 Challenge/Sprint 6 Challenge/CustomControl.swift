//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Michael Flowers on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    //we want to set the value of the x position equal to that of the control's value changed value
    var xValue = 0.0
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
       updateValue(for: touch)
        sendActions(for: .touchDown)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
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
        
        if bounds.contains(touchPoint){
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(for touch: UITouch){
        let touch = touch.location(in: self)
        let xRange = touch.x / bounds.width
        xValue = Double(xRange)
        sendActions(for: .valueChanged)
    }
}
