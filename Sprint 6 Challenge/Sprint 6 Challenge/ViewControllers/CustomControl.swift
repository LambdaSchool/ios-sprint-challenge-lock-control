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
    let blackBackground = UIView(frame: CGRect(x: 30, y: 300, width: 210, height: 40))
    static var thumb = UIView(frame: CGRect(x: 4, y: 6, width: 30, height: 30))
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        blackBackground.backgroundColor = .black
        blackBackground.layer.cornerRadius = 18
        CustomControl.thumb.backgroundColor = AppearanceHelper.darkRed
        CustomControl.thumb.layer.cornerRadius = 15
        addSubview(blackBackground)
        blackBackground.addSubview(CustomControl.thumb)
        CustomControl.thumb.isUserInteractionEnabled = false
    }
    
    
    func updateValue(at touch: UITouch) {
            let touchPoint = touch.location(in: blackBackground)
            if bounds.contains(touchPoint) {
                CustomControl.value = touchPoint.x
                print(CustomControl.value)
                sendActions(for: [.valueChanged])
                if touchPoint.x < 190 && touchPoint.x > 16 {
                    CustomControl.thumb.center.x = touchPoint.x
                }
            } else {
                sendActions(for: [.valueChanged])
            }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if blackBackground.frame.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            print("The touch went outside the bounds of the view")
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: blackBackground)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        if touchPoint.x < 160 {
            UIView.animate(withDuration: 1.0) {
                CustomControl.thumb.frame = CGRect(x: 4, y: 6, width: 30, height: 30)
            }
        } else {
            CustomControl.thumb.frame = CGRect(x: 177, y: 6, width: 30, height: 30)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: [.touchCancel])
    }
}
