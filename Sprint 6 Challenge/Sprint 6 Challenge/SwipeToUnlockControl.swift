//
//  SwipeToUnlockControl.swift
//  Sprint 6 Challenge
//
//  Created by Samantha Gatt on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SwipeToUnlockControl: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        oval = subviews.first
//        setupSubviewCustomControl()
//        print("HELLO WORLD!!!!!", oval)
    }
    
    
    // MARK: - Properties
    
    var oval: UIView!
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // oval doesn't need to be animated because touch should be in the same place?
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
            oval.frame = newOvalPosition(for: touchPoint)
            
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
            
            oval.frame = newOvalPosition(for: touchPoint)
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    
    // MARK: - Private Functions
    
    @inline(__always) private func newOvalPosition(for location: CGPoint) -> CGRect {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dx = location.x - center.x
        
        let frame = oval.frame
        
        return frame
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - functions
    
//    func setupSubviewCustomControl() {
//        let oval = UIView()
//        translatesAutoresizingMaskIntoConstraints = false
//        oval.backgroundColor = UIColor.darkGray
//        addSubview(oval)
//
//        print("HELLO WORLD!!!!!!! 2", self.center)
//        let ovalCenterY = NSLayoutConstraint(item: oval, attribute: .centerY,
//                                             relatedBy: .equal,
//                                             toItem: self, attribute: .centerY,
//                                             multiplier: 1,
//                                             constant: 0.0)
//        let ovalLeading = NSLayoutConstraint(item: oval, attribute: .leading,
//                                             relatedBy: .equal,
//                                             toItem: self, attribute: .leading,
//                                             multiplier: 1,
//                                             constant: 0.0)
//        let ovalWidth = NSLayoutConstraint(item: oval, attribute: .width,
//                                           relatedBy: .equal,
//                                           toItem: nil, attribute: .notAnAttribute,
//                                           multiplier: 1,
//                                           constant: 40.0)
//        let ovalHeight = NSLayoutConstraint(item: oval, attribute: .height,
//                                            relatedBy: .equal,
//                                            toItem: nil, attribute: .notAnAttribute,
//                                            multiplier: 1,
//                                            constant: 40.0)
//        NSLayoutConstraint.activate([ovalCenterY, ovalLeading, ovalWidth, ovalHeight])
//
//        self.oval = oval
//    }
}
