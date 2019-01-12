//
//  Slider.swift
//  Sprint 6 Challenge
//
//  Created by Julian A. Fordyce on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class Slider: UIControl {

    // use these values to track my custom slider
    // anywhere from 0 to  0.80 the image view will "remain" the locked image
    // once the slider passes 0.80, animation will begin
    // create animation with a duration to bring up the unlocked picture
   
    var beginningValue: CGFloat = 0
    var twentyValue: CGFloat = 0.2
    var fortyValue: CGFloat = 0.4
    var sixtyValue: CGFloat = 0.6
    var eightyValue: CGFloat = 0.8
    var endValue: CGFloat = 1
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        sendActions(for: [.valueChanged, .touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self
        if bounds.contains(touchPoint) {
            
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
    }
    
    override func cancelTracking(with event: UIEvent?) {
    }
  
}



