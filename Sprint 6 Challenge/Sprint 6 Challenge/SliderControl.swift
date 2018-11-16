//
//  SliderControl.swift
//  Sprint 6 Challenge
//
//  Created by Jonathan T. Miles on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class SliderControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    // create the nested slider object
    let sliderFocus = UIView()
    
    func setup() {
        sliderFocus.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        sliderFocus.backgroundColor = .black
        self.addSubview(sliderFocus)
    }
    
    // allow for its smooth animation left-to-right
    func updateXValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            UIView.animate(withDuration: 0.0) {
                var frame = self.sliderFocus.frame
                
                frame.origin.x = touchPoint.x
                
                self.sliderFocus.frame = frame
            }
        }
    }
    
    // call touch functions to define how the user controls the interface
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateXValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateXValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
            updateXValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    // remember to set the view subclass in storyboards - check
    
    // also if else animate the reset button
    
    // also set "themes" using UIAppearance
}
