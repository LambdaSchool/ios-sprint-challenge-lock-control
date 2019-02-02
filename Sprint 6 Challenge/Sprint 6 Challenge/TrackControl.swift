//
//  TrackControl.swift
//  Sprint 6 Challenge
//
//  Created by Jocelyn Stuart on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TrackControl: UIControl {
    
    
    
    var ballLabel: UILabel = UILabel()
    
    var value: Int = 1
    
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        
        self.layer.cornerRadius = 20
        
        ballLabel.frame = CGRect(x: 0.0, y: 0, width: 40 , height: 40)
        ballLabel.textAlignment = .center
        ballLabel.text = "●"
        ballLabel.font = UIFont.boldSystemFont(ofSize: 40)
        self.addSubview(ballLabel)
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        return true
        
        
    }
    
    func moveBall() {
        print("Move Ball")
        UIView.animate(withDuration: 0) {
            self.ballLabel.center.x = 0
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            
            UIView.animate(withDuration: 0) {
                if touchPoint.x >= 192 {
                    self.ballLabel.center.x = 215
                    self.value = Int(touchPoint.x)
                } else if touchPoint.x <= 20 {
                    self.ballLabel.center.x = 20
                    self.value = Int(touchPoint.x)
                } else {
                    self.ballLabel.center.x = touchPoint.x
                    self.value = Int(touchPoint.x)
                }
                self.sendActions(for: [.valueChanged, .touchDragInside])
            
            }
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
        
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
           // isLocked = self.lockControl(for: touchPoint)
            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        print("Touch tracking ended")
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        print("Touch tracking cancelled")
    }
    
    
}
