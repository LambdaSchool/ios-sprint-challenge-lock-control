//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Nathan Hedgeman on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class LockController: UIControl {

    //Properties
    
    var isUnlocked: Bool = false
    let minValue: CGFloat = 0
    let maxValue: CGFloat = 1
    var lockSliderValue: CGFloat = 0
    
    var currentLocation = CGPoint()
    var previousLocation = CGPoint()
    
    var lockSliderView = UIView()
    
    
    //Slider height and width
    var lockSliderWidth: CGFloat {
        
        return frame.height * 0.825
    }
    
    var lockSliderHeight: CGFloat {
        
        return frame.width * 0.15
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createSlider(lockSliderView)
    }
    
    
    // Functions
    func createSlider(_ slider: UIView) {
        let sliderRect = CGRect(x: 5, y: 5, width: lockSliderWidth, height: lockSliderWidth)
        
        slider.frame = sliderRect
        slider.backgroundColor = .black
        slider.layer.cornerRadius = lockSliderWidth / 2
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(slider)
        
        slider.isUserInteractionEnabled = false
        
    }
    
    func updateSlider() {
        
        lockSliderView.frame = getSliderRect(for: CGFloat(lockSliderValue))
        
    }
    
    
    func getSliderRect(for value:CGFloat) -> CGRect {
        let x = ((bounds.width - lockSliderWidth - 10) * value) + 5
        let y = (bounds.height - lockSliderWidth) / 2
        
        return CGRect(x: x, y: y, width: lockSliderWidth, height: lockSliderWidth)
    }

    
    
    //To reset the lock
    func reset() {
        
        lockSliderValue = 0.0
        isUnlocked = false
        updateSlider()
        
    }
    
    
    
    //Tracking Controls
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let previousLocation = touch.location(in: self)
        
        if lockSliderView.frame.contains(previousLocation) {
            
            sendActions(for: [.touchDown, .valueChanged])
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        currentLocation = touch.location(in: self)
        
        let locationChange = currentLocation.x - previousLocation.x
        let valueChange = (maxValue - minValue) * locationChange / bounds.width
        
        previousLocation = currentLocation
        
        lockSliderValue = min(max((lockSliderValue + valueChange), minValue), maxValue)
        
        updateSlider()
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        
        currentLocation = touch.location(in: self)
        
        
        if lockSliderValue >= 0.8 {
            
            lockSliderValue = 1
            isUnlocked = true
            sendActions(for: [.touchUpInside, .valueChanged])
            
            UIView.animate(withDuration: 0.2) {
                self.lockSliderView.frame = self.getSliderRect(for: 1.0)
                
            }
            
        }   else {
            
            lockSliderValue = 0
            isUnlocked = false
            sendActions(for: [.touchUpInside, .valueChanged])
            
            UIView.animate(withDuration: 0.5) {
                
                self.lockSliderView.frame = self.getSliderRect(for: 0.0)
            }
        }
        
        updateSlider()
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
}
