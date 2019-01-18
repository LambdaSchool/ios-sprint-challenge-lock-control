//
//  CustomControl.swift
//  Sprint6 Lock Control
//
//  Created by Sergey Osipyan on 1/18/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    static var value: CGFloat = 0.0
    static var blackCircle = UIView(frame: CGRect(x: 7, y: 7, width: 38, height: 38))
    var sliderGreyBackground = UIView(frame: CGRect(x: 8, y: 225, width: 263, height: 50))
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        sliderGreyBackground.backgroundColor = UIColor.darkGray
        sliderGreyBackground.layer.cornerRadius = sliderGreyBackground.frame.height/2
        self.addSubview(sliderGreyBackground)
        CustomControl.blackCircle.backgroundColor = .black
        CustomControl.blackCircle.layer.cornerRadius = CustomControl.blackCircle.frame.height/2
        sliderGreyBackground.addSubview(CustomControl.blackCircle)
        sliderGreyBackground.isUserInteractionEnabled = false
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: sliderGreyBackground)
        if  sliderGreyBackground.bounds.contains(touchPoint) {
            CustomControl.value = touchPoint.x
            print(touchPoint.x)
            sendActions(for: [.valueChanged])
            if touchPoint.x > 26 && touchPoint.x < 235 {
                CustomControl.blackCircle.center.x = touchPoint.x
                sendActions(for: [.valueChanged])
            }
        }
    }
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: CustomControl.blackCircle)
        if CustomControl.blackCircle.bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDown, .valueChanged]) // we don't need this line
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderGreyBackground)
        if sliderGreyBackground.bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            print("out")
            UIView.animate(withDuration: 0.03) {
            self.sliderGreyBackground.backgroundColor = .red
            self.sliderGreyBackground.backgroundColor = UIColor.darkGray
        }
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: sliderGreyBackground)
        if sliderGreyBackground.bounds.contains(touchPoint) {
            if touchPoint.x < sliderGreyBackground.frame.width * 0.8 {  // 80 %
                UIView.animate(withDuration: 0.3) {
                    CustomControl.blackCircle.frame = CGRect(x: 7, y: 7, width: 38, height: 38)
                    self.sendActions(for: [.valueChanged])
                }
            }
            if touchPoint.x >= sliderGreyBackground.frame.width * 0.8 {  // 80 %
                UIView.animate(withDuration: 0.3) {
                    CustomControl.blackCircle.frame = CGRect(x: 220, y: 7, width: 38, height: 38)
                    self.sendActions(for: [.valueChanged])
                }
            }
            
            sendActions(for: [.touchUpInside])
            
        } else {
            
            if touchPoint.x < sliderGreyBackground.frame.width * 0.8 {   // 80 %
                UIView.animate(withDuration: 0.3) {
                    CustomControl.blackCircle.frame = CGRect(x: 7, y: 7, width: 38, height: 38)
                    self.sendActions(for: [.valueChanged])
                }
            }
            if touchPoint.x >= sliderGreyBackground.frame.width * 0.8 {  // 80 %
                UIView.animate(withDuration: 0.3) {
                    CustomControl.blackCircle.frame = CGRect(x: 220, y: 7, width: 38, height: 38)
                    self.sendActions(for: [.valueChanged])
                }
            }
            
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: [.touchCancel])
    }
}

