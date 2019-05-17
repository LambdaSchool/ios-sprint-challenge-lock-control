//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Sameera Roussi on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    var sliderThumbImage = UIImage(named: "blackDot")
    private let thumbLayer = CALayer()
    let thumbImageView = UIImageView()
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        layer.addSublayer(thumbLayer)
        thumbImageView.image  = sliderThumbImage
        addSubview(thumbImageView)
    }
    
//    required override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        layer.addSublayer(thumbLayer)
//        thumbImageView.image  = sliderThumbImage
//        addSubview(thumbImageView)
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    //var blackDot = "⚫️"
    var value = 0
 //   private let upperThumbImageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        let radius: CGFloat = 22
        layer.cornerRadius = radius
        
//        layer.borderWidth = 5
//        layer.borderColor = UIColor.red.cgColor
    }

    
    // MARK: Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            value = Int(touchPoint.x)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            value = Int(touchPoint.x)
//            print(touchPoint.x)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
