//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Michael Flowers on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var valueX = 0.0
    
    required init?(coder aCoder: NSCoder){ //this is to allow us to draw the customControl
        super.init(coder: aCoder)
        setup()
    }
    
    func updateValue(at touch: UITouch){
        let touchPoint = touch.location(in: self)
        let x = touchPoint.x / bounds.width
        valueX = Double(x)
        sendActions(for: [.valueChanged])
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
             sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    
    func setup(){
        
    }
    
   
}
