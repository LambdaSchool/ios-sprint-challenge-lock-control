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
    
    // MARK: - View Loading
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
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
        
        // Create slider
        let radius = sliderBar.frame.height - 6
        let sliderFrame = CGRect(x: 5, y: 5/2, width: radius, height: radius)
        let slider = UIView(frame: sliderFrame)
        slider.isUserInteractionEnabled = false
        slider.layer.cornerRadius = radius/2
        slider.layer.backgroundColor = UIColor.black.cgColor
        slider.clipsToBounds = true
        sliderBar.addSubview(slider)
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
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        
        createSlider()
        createImage()
    }

    // MARK: - Touch Handling
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
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
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }

}
