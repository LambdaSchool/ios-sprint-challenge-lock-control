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
    
    var lockSliderWidth: CGFloat {
        
        return frame.height * 0.825
    }
    
    var lockSliderView = UIView()
    
    
    func createSlider(_ slider: UIView) {
        let sliderRect = CGRect(x: 5, y: 5, width: lockSliderWidth, height: lockSliderWidth)
        slider.frame = sliderRect
        slider.backgroundColor = .black
        slider.layer.cornerRadius = lockSliderWidth / 2
        
        addSubview(slider)
        
        slider.isUserInteractionEnabled = false
    }
    
    
}
