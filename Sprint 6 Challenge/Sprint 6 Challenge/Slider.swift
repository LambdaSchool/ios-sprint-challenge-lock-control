//
//  Slider.swift
//  Sprint 6 Challenge
//
//  Created by Victor  on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
import Foundation
import UIKit

@IBDesignable class Slider: UIControl {
    
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
    
    
    
}
