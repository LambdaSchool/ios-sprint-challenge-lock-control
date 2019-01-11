//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Madison Waters on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    // MARK: - Properties
    let slider = UIView()
    let sliderFrame = UIView()
    
    // MARK: - Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        controlFrame()
        controlSlider()
    }
    
    required init? (coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        controlFrame()
        controlSlider()
    }
    
    func controlSlider() {
        
        slider.isUserInteractionEnabled = false
        slider.frame = CGRect(x: 53, y: 428, width: 45, height: 45)
        slider.layer.cornerRadius = frame.height / 2
        slider.backgroundColor = .black
        addSubview(slider)
    }
    
    func controlFrame() {
        
        sliderFrame.isUserInteractionEnabled = false
        sliderFrame.frame = CGRect(x: 45, y: 420, width: 283, height: 60)
        sliderFrame.layer.cornerRadius = frame.height / 2
        sliderFrame.backgroundColor = .lightGray
        addSubview(sliderFrame)
    }
    
    func draw(at point: CGPoint) {
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderFrame)
        
        if sliderFrame.bounds.contains(touchPoint) {
            print("begin tracking: \(touchPoint)")
            
        } else {
            
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderFrame)
        
        if sliderFrame.bounds.contains(touchPoint) {
            print("continue tracking: \(touchPoint)")
            
        } else {
            
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
       sendActions(for: .touchCancel)
    }
    
}
