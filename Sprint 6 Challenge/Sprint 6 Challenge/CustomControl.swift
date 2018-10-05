//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Ilgar Ilyasov on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createDot()
    }
    
    // Create a dot
    
    func createDot() {
        
        let dot = UIView()
        let swipeFrameX = self.frame.origin.x
        let swipeFrameY = self.frame.origin.y
        dot.frame = CGRect(x: swipeFrameX + 10, y: swipeFrameY-130, width: 60, height: 60)
        dot.layer.cornerRadius = 30
        dot.backgroundColor = .black
        
        self.addSubview(dot)
    }

    // Add touch handler
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        updateLocation(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateLocation(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateLocation(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        // if customcontrol contains touchpoint
        // then set dot's frame to touchpoint
        sendActions(for: .valueChanged)
    }

    func animate() {
        // animate image and button
    }
}
