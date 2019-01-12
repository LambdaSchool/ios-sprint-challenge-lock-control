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
    var lockImage = UIImageView()
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    var isUnLocked: Bool = false
    
    // MARK: - Methods
    required init? (coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        clipsToBounds = true
        layer.cornerRadius = 38.0
        frameSetup()
        sliderSetup()
    }
    
    func sliderSetup() {
        clipsToBounds = true
        slider.isUserInteractionEnabled = false
        slider.frame = CGRect(x: 8, y: 8, width: 44, height: 44)
        slider.layer.cornerRadius = slider.frame.height / 2
        slider.backgroundColor = .black
        sliderFrame.addSubview(slider)
    }
        
    func frameSetup() {
        sliderFrame.isUserInteractionEnabled = false
        sliderFrame.frame = CGRect(x: 8, y: 242, width: frame.width - 16, height: 60)
        sliderFrame.layer.cornerRadius = sliderFrame.frame.height / 2
        sliderFrame.backgroundColor = .gray
        self.addSubview(sliderFrame)
        
        let imageFrame = CGRect(x: 75, y: 25, width: self.bounds.width / 2, height: self.bounds.height / 1.75)
        lockImage = UIImageView(frame: imageFrame)
        lockImage.image = lockedImage
        self.addSubview(lockImage)
    }
    
    func trackSlider(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        UIView.animate(withDuration: 0.1){
            self.slider.center.x = touchPoint.x
        }
        
        if slider.center.x > sliderFrame.bounds.width * 0.80 {
            lockImage.image = unlockedImage
            isUnLocked = true
            sendActions(for: .valueChanged)
            
        } else {
            lockImage.image = lockedImage
            isUnLocked = false
            sendActions(for: .valueChanged)
        }
    }
    
    func resetSlider() {
        UIView.animate(withDuration: 0.1){ self.slider.frame.origin.x = 8 }
    }
    
    func sliderEndPoint() {
        UIView.animate(withDuration: 0.1){ self.slider.frame.origin.x = self.sliderFrame.bounds.maxX - 52 }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderFrame)
        
        if sliderFrame.bounds.contains(touchPoint) {
            trackSlider(at: touch)
            sendActions(for: [.touchDown, .valueChanged])
        } else { sendActions(for: [.valueChanged]) }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderFrame)
        
        if sliderFrame.bounds.contains(touchPoint) {
            trackSlider(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else { sendActions(for: [.touchDragOutside, .valueChanged]) }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        if slider.center.x < sliderFrame.bounds.width * 0.80 {
            resetSlider()
            sendActions(for: [.touchDragOutside, .valueChanged])
        } else { sliderEndPoint() }
    }
    
    override func cancelTracking(with event: UIEvent?) {
       sendActions(for: .touchCancel)
    }
}


