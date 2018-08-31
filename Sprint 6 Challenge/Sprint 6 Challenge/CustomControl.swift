//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Linh Bouniol on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var isUnlocked = false
    
    // make properties for the views in the control
    var circleView: UIView! // we can assume it'ss always be available, since we create it in the init via setup
    var imageView: UIImageView!
    
    // Custom Control's appearance
    override var intrinsicContentSize: CGSize {
        clipsToBounds = true
        self.layer.cornerRadius = 40
        return CGSize(width: 230, height: 230)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        
        imageView = UIImageView(frame: CGRect(x: 50, y: 30, width: 150, height: 150))
        imageView.image = #imageLiteral(resourceName: "Locked")
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        let sliderView = UIView(frame: CGRect(x: 10, y: 200, width: 260, height: 75))
        sliderView.layer.cornerRadius = 35
        sliderView.backgroundColor = UIColor(red: 134.0/255.0, green: 163.0/255.0, blue: 212.0/255.0, alpha: 1.0)
        sliderView.isUserInteractionEnabled = false
        self.addSubview(sliderView)
        
        circleView = UIView(frame: CGRect(x: 20, y: 205, width: 60, height: 60))
        circleView.layer.cornerRadius = 30
        circleView.backgroundColor = UIColor(red: 98.0/255.0, green: 119.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        circleView.isUserInteractionEnabled = false
        self.addSubview(circleView)
        
    }
    
    func reset() {
        UIView.animate(withDuration: 0.3) {
            self.circleView.frame = CGRect(x: 20, y: 205, width: 60, height: 60)
        }
        
        isUnlocked = false
        imageView.image = #imageLiteral(resourceName: "Locked")
        sendActions(for: .primaryActionTriggered)
    }
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if circleView.frame.contains(touchPoint) {
            return true
        } else {
            return false
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        guard touchPoint.x > 0 && touchPoint.x < bounds.width - circleView.frame.width else { return true }
        
        circleView.frame = CGRect(x: touchPoint.x, y: 205, width: 60, height: 60)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event)}

        guard let touchPoint = touch?.location(in: self) else { return }
        if touchPoint.x > (0.80 * (bounds.width - circleView.frame.width)) {
            isUnlocked = true
            imageView.image = #imageLiteral(resourceName: "Unlocked")
            sendActions(for: .primaryActionTriggered)
            

            UIView.animate(withDuration: 0.3) {
                self.circleView.frame = CGRect(x: 200, y: 205, width: 60, height: 60)
            }
        } else {
            reset()
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        
        reset()
    }
    
}
