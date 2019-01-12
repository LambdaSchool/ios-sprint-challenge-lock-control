//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Ivan Caldwell on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    static var value: CGFloat = 1.0
    let grayBackground = UIView(frame: CGRect(x: 30, y: 300, width: 210, height: 40))
    static var thumb = UIView(frame: CGRect(x: 4, y: 6, width: 30, height: 30))

    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        grayBackground.backgroundColor = #colorLiteral(red: 0.4194162437, green: 0.4194162437, blue: 0.4194162437, alpha: 1)
        grayBackground.layer.cornerRadius = 18
        CustomControl.thumb.backgroundColor = .black
        CustomControl.thumb.layer.cornerRadius = 15
        addSubview(grayBackground)
        grayBackground.addSubview(CustomControl.thumb)
        CustomControl.thumb.isUserInteractionEnabled = false
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            print("Began Tracking")
            //updateValue(at: touch)
            sendActions(for: [.touchDown, .valueChanged])
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            print("The touch went outside the bounds of the view")
            //sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: grayBackground)
        print("Ended Tracking")
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
            if touchPoint.x < 145 {
                UIView.animate(withDuration: 1.0) {
                    CustomControl.thumb.frame = CGRect(x: 4, y: 6, width: 30, height: 30)
                }
            } else {
                CustomControl.thumb.frame = CGRect(x: 177, y: 6, width: 30, height: 30)
            }
        } else {
            sendActions(for: [.touchUpOutside])
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        if grayBackground.frame.contains(touchPoint) {
            CustomControl.value = touchPoint.x
            print(CustomControl.value)
            sendActions(for: [.valueChanged])
            if touchPoint.x < 190 && touchPoint.x > 30 {
                CustomControl.thumb.center.x = touchPoint.x
            }
        }
    }
}
