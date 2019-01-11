//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by David Doswell on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var sliderLock: ViewController?
    var sliderUnlock: UnlockViewController?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        layer.cornerRadius = 30.0
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        print("Begin Tracking \(touchPoint)")

        // TODO
        sendActions(for: [.touchDown, .valueChanged])
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            print("Continue Tracking \(touchPoint)")
            
            // TODO
            sendActions(for: [.valueChanged, .touchDragInside])
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
            print("Finish Tracking \(touchPoint)")
            
            // TODO
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
    
}

