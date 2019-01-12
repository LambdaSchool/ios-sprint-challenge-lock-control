//
//  CustomControl.swift
//  UIControl
//
//  Created by Sergey Osipyan on 1/8/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    static var value: CGFloat = 0.0
    static var blackCircle = UIView(frame: CGRect(x: 7, y: 7, width: 37, height: 37))
    var sliderGreyBackground = UIView(frame: CGRect(x: 9, y: 223, width: 263, height: 50))
    
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        sliderGreyBackground.backgroundColor = UIColor.darkGray
        sliderGreyBackground.layer.cornerRadius = 22
        self.addSubview(sliderGreyBackground)
        CustomControl.blackCircle.backgroundColor = .black
        CustomControl.blackCircle.layer.cornerRadius = 15
        sliderGreyBackground.addSubview(CustomControl.blackCircle)
       
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        if sliderGreyBackground.bounds.contains(touchPoint) {
            CustomControl.value = touchPoint.x
            sendActions(for: [.valueChanged])
            CustomControl.blackCircle.center.x = touchPoint.x
        } else {
           // CustomControl.blackCircle.frame = CGRect(x: 7, y: 7, width: 37, height: 37)
            sendActions(for: [.valueChanged])
        }
        sendActions(for: [.valueChanged])
        }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) { // if sliderGreyBackground.bounds.contains(touchPoint)
        updateValue(at: touch)
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
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: [.touchCancel])
    }
}
