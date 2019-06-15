//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Michael Stoffer on 6/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    var lock: UIImage = UIImage(named: "Locked")!
    let circleControl = UIView()
    let slideBackground = UIView()
    let imageView = UIImageView()
    let lockView = UIView()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }

    private func setup() {
        let superViewSize: CGFloat = 280.0
        
        // create background
        lockView.frame = CGRect(x: 0.0, y: 0.0, width: superViewSize, height: superViewSize)
        lockView.backgroundColor = .gray
        lockView.layer.cornerRadius = superViewSize / 8
        addSubview(lockView)
        lockView.isUserInteractionEnabled = false
        
        // create lock
        imageView.frame = CGRect(x: superViewSize / 4, y: superViewSize / 4 - 60.0, width: 440.0 / 3.0, height: 586.0 / 3.0)
        imageView.image = lock
        addSubview(imageView)
        imageView.isUserInteractionEnabled = false
        
        // create slide background
        slideBackground.frame = CGRect(x: 10.0, y: superViewSize - 60.0, width: superViewSize - 20.0, height: 50.0)
        slideBackground.backgroundColor = .darkGray
        slideBackground.layer.cornerRadius = 25
        addSubview(slideBackground)
        slideBackground.isUserInteractionEnabled = false
        
        // create controlable circle
        circleControl.frame = CGRect(x: 15.0, y: superViewSize - 55.0, width: 40.0, height: 40.0)
        circleControl.backgroundColor = .black
        circleControl.layer.cornerRadius = 20.0
        addSubview(circleControl)
    }
    
    private func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        if slideBackground.frame.contains(touchPoint) {
            print(touchPoint)
        }
    }
    
    // MARK: - Touch Handlers
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
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
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
