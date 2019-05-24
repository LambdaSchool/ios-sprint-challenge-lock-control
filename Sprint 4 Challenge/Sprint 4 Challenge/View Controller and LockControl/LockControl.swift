//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Lisa Sampson on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {

    // MARK: - Properties
    private var image: UIImageView!
    private var slider: UIView!
    private var sliderBar: UIView!
    private var isLocked: Bool = true
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - Setup + Teardown
    func setup() {
        
        self.backgroundColor = Appearance.offEggplant
        
        // Create Image
        image = UIImageView(image: UIImage(named: "Locked"))
        image.frame = CGRect(x: (bounds.width - image.bounds.width) / 2.0, y: 8, width: image.bounds.width, height: image.bounds.height) // will center image 8 points from top of view
        addSubview(image)
        
        // Create Bar
        sliderBar = UIView()
        sliderBar.layer.cornerRadius = 27 // half of height
        sliderBar.backgroundColor = .white
        sliderBar.clipsToBounds = true
        sliderBar.isUserInteractionEnabled = false
        sliderBar.frame = CGRect(x: 16, y: image.frame.maxY + 8, width: self.frame.width - 32, height: 54) // Bar is 16 point in on leading and trailing and 8 points down from the bottom of the image. 54 because apple says 44 points is a good size for touchable items (the slider) and I want 5 points on either side of the slider (44 + 5 + 5 = 54)
        addSubview(sliderBar)
        
        // Create Slider
        slider = UIView()
        slider.layer.cornerRadius = 22 // half of height
        slider.backgroundColor = Appearance.eggplant
        slider.clipsToBounds = true
        slider.isUserInteractionEnabled = false
        slider.frame = CGRect(x: 5, y: 5, width: 44, height: 44)
        sliderBar.addSubview(slider)
    }
    
    func reset() {
        UIView.animate(withDuration: 0.2) {
            self.slider.frame.origin.x = 5 // returns slider to original position
        }
        isUserInteractionEnabled = true
        image.image = UIImage(named: "Locked")
        isLocked = true
    }
    
    // MARK: - Touch Handling
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: slider)
        if slider.bounds.contains(touchPoint) {
            sendActions(for: [.touchDown])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: sliderBar)
        slider.center.x = touchPoint.x // tells slider that its center should be whereever the touch is
        
        // stops slider from moving past the slider bar in either direction
        if slider.frame.minX < 5 {
            slider.frame.origin.x = 5
        } else if slider.frame.maxX > sliderBar.bounds.width - 5 {
            slider.frame.origin.x = sliderBar.bounds.width - slider.bounds.width - 5
        }
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: sliderBar)
        let oldValue = isLocked // records what isLocked was before the rest of the code is run
        
        isLocked = touchPoint.x < sliderBar.bounds.width * 0.8 // if touchPoint hasn't traveled 80% of the sliderBar, isLocked is true. If it has reached 80%, isLocked is false
        
        if oldValue != isLocked { // if they are different then the lock should become unlocked
            image.image = UIImage(named: "Unlocked")
            isUserInteractionEnabled = false
            
            UIView.animate(withDuration: 0.2) {
                self.slider.frame.origin.x = self.sliderBar.bounds.width - self.slider.bounds.width - 5  // animates the slider to fully extend to the end
            }
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            
            UIView.animate(withDuration: 0.2) {
                self.slider.frame.origin.x = 5 // returns slider to initial position
            }
            
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
