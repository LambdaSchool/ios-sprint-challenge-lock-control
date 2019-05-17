//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Lisa Sampson on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    // MARK: - Properties
    private let lockedImage = UIImage(named: "Locked")
    private let unlockedImage = UIImage(named: "Unlocked")
    private var image: UIImageView!
    private var slider: UIView!
    private var sliderBar: UIView!
    private var sliderBarUpperBounds: CGRect!
    
    private(set) var isLocked: Bool = true
    
    // MARK: - View Loading
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup and Teardown
    
    func createSlider() {
        
        // Create slider bar
        let width = self.frame.width - 16*2
        let height = self.frame.height/6
        let y = self.frame.height - height - 10
        let frame = CGRect(x: 16, y: y, width: width, height: height)
        let sliderBar = UIView(frame: frame)
        sliderBar.isUserInteractionEnabled = false
        sliderBar.layer.cornerRadius = height/2
        sliderBar.layer.backgroundColor = UIColor.gray.cgColor
        sliderBar.clipsToBounds = true
        addSubview(sliderBar)
        self.sliderBar = sliderBar
        
        // Create slider
        let radius = sliderBar.frame.height - 6
        let sliderFrame = CGRect(x: 5, y: 5/2, width: radius, height: radius)
        let slider = UIView(frame: sliderFrame)
        slider.isUserInteractionEnabled = false
        slider.layer.cornerRadius = radius/2
        slider.layer.backgroundColor = UIColor.black.cgColor
        slider.clipsToBounds = true
        sliderBar.addSubview(slider)
        self.slider = slider
        
        // 80%
        let sliderBarWidth = sliderBar.frame.width
        let upperBounds = CGRect(x: sliderBar.frame.origin.x + sliderBarWidth/5*4, y: sliderBar.frame.origin.y, width: sliderBarWidth/5, height: sliderBar.frame.height)
        sliderBarUpperBounds = upperBounds
    }
    
    func createImage() {
        let width = self.frame.width/2
        let x = width/2
        let y = width/2
        let frame = CGRect(x: x, y: y, width: width, height: width)
        let image = UIImageView(frame: frame)
        
        image.isUserInteractionEnabled = false
        image.image = lockedImage
        image.contentMode = .scaleAspectFit
        addSubview(image)
        self.image = image
    }
    
    func setup() {
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = 48
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        
        createSlider()
        createImage()
    }
    
    func reset() {
        isLocked = true
        slider.frame = self.convert(slider.frame, to: sliderBar)
        image.image = lockedImage
    }

    // MARK: - Touch Handling
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if slider.frame.contains(touchPoint) {
            
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if sliderBar.frame.contains(touchPoint) {
            let sliderBarFrame = sliderBar.frame
            let frame = CGRect(x: touchPoint.x-slider.frame.width/2, y: sliderBarFrame.origin.y, width: sliderBarFrame.width, height: sliderBarFrame.height)
            slider.frame = frame
            
            if sliderBarUpperBounds.contains(touchPoint) {
                image.image = unlockedImage
                isLocked = false
                return false
            }
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
        if sliderBarUpperBounds.contains(touchPoint) {
            image.image = unlockedImage
            isLocked = false
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            slider.frame = self.convert(slider.frame, to: sliderBar)
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }

}
