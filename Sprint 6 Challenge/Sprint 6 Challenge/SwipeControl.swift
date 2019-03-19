//
//  SwipeControl.swift
//  Sprint 6 Challenge
//
//  Created by Farhan on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SwipeControl: UIControl {
    
    // MARK :- Properties
    
    let trackingBall = UILabel()
    
    let lockedImage = UIImage(named: "Locked")!
    let unlockedImage = UIImage(named: "Unlocked")!
    
    let lockImageView = UIImageView()
    
    let swipeContainerView = UIView()
    
    var unlockedValueTracker: Int = 100
    
    // MARK :- Local Functions
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        
//        // init with locked image
//        lockImageView.image = lockedImage
//
//        // setup main big container
//        let containerViewFrame = CGRect(x: 0, y: 0, width: 350, height: 350.0)
//        let containerView = UIView(frame: containerViewFrame)
//        containerView.backgroundColor = .gray
//        containerView.layer.cornerRadius = 50
//        self.addSubview(containerView)
//
//        // setup image view and add to container
//        let imageViewFrame = CGRect(x: 0, y: 0, width: lockedImage.size.width, height: lockedImage.size.height)
//        lockImageView.frame = imageViewFrame
//        lockImageView.center.x = containerView.frame.width / 2
//        lockImageView.layoutIfNeeded()
//        containerView.addSubview(lockImageView)
//
//        //setup swipe Container
//        swipeContainerView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
//
        let swipeContainerViewFrame = CGRect(x: 10, y: 300, width: lockImageView.bounds.width + 100, height: 38)
        swipeContainerView.frame = swipeContainerViewFrame
        swipeContainerView.center.x = self.center.x
        swipeContainerView.layer.cornerRadius = 20
        addSubview(swipeContainerView)
        
        // setup Label
        trackingBall.font = UIFont(name: "AppleColorEmoji", size: 30.0)!
        trackingBall.text = "⚫️"
        trackingBall.textAlignment = .left
        trackingBall.textColor = .gray
        
        // setup container view
        trackingBall.frame = CGRect(x: 0, y: 0, width: 30, height: 35)
        
        // add tracking ball to container view
        swipeContainerView.addSubview(trackingBall)
        
        
    }
    
    private func updateValue (at touch: UITouch){
        
        // change x positon of the tracking ball
        
        let touchPoint = touch.location(in: self)
        
        if trackingBall.frame.contains(touchPoint) {
//
            let percentage = calculatePercentage(with: touchPoint)
            let offset = (percentage * 178) + 6
            trackingBall.frame = thumbOffset(by: offset)
//
//           
//        self.trackingBall.frame = self.trackingBall.frame.offsetBy(dx: 10, dy: 0)
            
            
        }
        
    }
    
    /// Calculates a percentage travelled within the slider bar, with provisions for travelling beyond it.
    private func calculatePercentage(with point: CGPoint) -> CGFloat {
        var percentage = point.x / (200)
        if percentage > 1.0 {
            percentage = 1.0
        } else if percentage < 0.0 {
            percentage = 0.0
        }
        return percentage
    }
    
    /// Returns the new frame for the thumb offest by the given point.
    private func thumbOffset(by offset: CGFloat) -> CGRect {
        return CGRect(x: offset, y: 6, width: 40, height: 38)
    }
    
    /// Animates the thumb sliding to the given point.
    private func slideThumb(to point: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.trackingBall.frame = self.thumbOffset(by: point)
        }
    }
    
    // MARK :- Custom Control Delegate
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        updateValue(at: touch)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
            
        } else {
            sendActions(for: [.touchDragOutside, .valueChanged])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touchPoint = touch?.location(in: self) else { return }
        
        if bounds.contains(touchPoint) {
            
//            updateValue(at: touch)
            
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside, .valueChanged])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: .touchCancel)
        
    }
    
    
    
}
