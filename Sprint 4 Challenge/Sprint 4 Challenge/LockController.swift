//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Nathan Hedgeman on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class LockController: UIControl {
    
    //Properties
    
    var isUnlocked: Bool = false
    let minValue: Double = 0
    let maxValue: Double = 1
    var lockSliderValue: Double = 0
    
    
    
    var sliderView = UIView()
    var lockSliderView = UIView()
    
    
    //Slider height and width
    var lockSliderWidth: CGFloat {
        
        return frame.height * 0.825
    }
    
    var lockSliderHeight: CGFloat {
        
        return frame.width * 0.15
    }
    
    
    
    // Functions
    func createSlider(_ slider: UIView) {
        let sliderRect = CGRect(x: 5, y: 5, width: lockSliderWidth, height: lockSliderWidth)
        
        slider.frame = sliderRect
        slider.backgroundColor = .black
        slider.layer.cornerRadius = lockSliderWidth / 2
        
        addSubview(slider)
        
        slider.isUserInteractionEnabled = false
    }
    
    func updateSlider() {
        
        sliderView.frame = getSliderRect(for: CGFloat(lockSliderValue))
        
    }
    
    func reset() {
        
        lockSliderValue = 0.0
        isUnlocked = false
        updateSlider()
        
    }
    
    func getSliderRect(for value:CGFloat) -> CGRect {
        let x = (bounds.width)
        let y = (bounds.height - lockSliderWidth) / 2
        
        return CGRect(x: x, y: y, width: lockSliderWidth, height: lockSliderWidth)
    }
    
    
    
    
    
}
