//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Ivan Caldwell on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    static var value: CGFloat = 0.0
    let slider = UIView(frame: CGRect(x: 15, y: 320, width: 280, height: 40))
    static var thumb = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    static var thumbEnable = true
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setAppearance()
    }
    
    func setAppearance() {
        self.layer.cornerRadius = 30
        slider.backgroundColor = UIColor.darkGray
        slider.layer.cornerRadius = slider.frame.height / 2
        CustomControl.thumb.backgroundColor = UIColor.black
        CustomControl.thumb.layer.cornerRadius = CustomControl.thumb.frame.height / 2
        self.addSubview(slider)
        slider.addSubview(CustomControl.thumb)
        CustomControl.thumb.isUserInteractionEnabled = false
        slider.isUserInteractionEnabled = false
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if CustomControl.thumbEnable{
            let touchPoint = touch.location(in: CustomControl.thumb)
            if CustomControl.thumb.bounds.contains(touchPoint) {
                updateValue(at: touch)
                sendActions(for: [.touchDown, .valueChanged])
                return true
            }
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if CustomControl.thumbEnable{
            let touchPoint = touch.location(in: slider)
            if slider.bounds.contains(touchPoint) {
                updateValue(at: touch)
                sendActions(for: [.touchDragInside, .valueChanged])
            }
            return true
        }
        return false
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if CustomControl.thumbEnable{
            defer { super.endTracking(touch, with: event) }
            guard let touch = touch else { return }
            let touchPoint = touch.location(in: slider)
            if slider.bounds.contains(touchPoint) {
                sendActions(for: [.touchUpInside, .valueChanged])
                if CustomControl.thumb.center.x <= 200 {
                    UIView.animate(withDuration: 1.5) {
                        CustomControl.thumb.center.x = 0 + CustomControl.thumb.frame.width / 2
                        CustomControl.value = 0
                        self.updateThumbValue()
                    }
                } else {
                    UIView.animate(withDuration: 0.2) {
                        CustomControl.thumb.center.x = self.slider.frame.width - CustomControl.thumb.frame.width / 2
                        CustomControl.value = 240
                        self.updateThumbValue()
                    }
                }
            } else {
                sendActions(for: [.touchUpOutside])
            }
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: slider)
        if slider.bounds.contains(touchPoint) {
            if touchPoint.x < 260 && touchPoint.x > 20 {
                sendActions(for: [.valueChanged])
                CustomControl.thumb.center.x = touchPoint.x
            }
        }
    }
    
    func updateThumbValue() {
        CustomControl.value = CustomControl.thumb.center.x
        sendActions(for: [.valueChanged])
    }
}
