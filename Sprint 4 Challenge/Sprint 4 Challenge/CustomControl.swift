//
//  CustomControl.swift
//  Sprint 4 Challenge
//
//  Created by Jeremy Taylor on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    // MARK: - Properties
    
    var isUnlocked: Bool = false
    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 1
    var thumbViewValue: CGFloat = 0.0
    
    
    private var thumbView = UIView()
    private var previousLocation = CGPoint()
    
    private var thumbViewWidth: CGFloat {
        return frame.height * 0.825
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupThumbView(thumbView)
        updateFrames()
    }
    
    private func setupThumbView(_ thumbView: UIView) {
        let thumbViewFrame = CGRect(x: 0, y: 0, width: thumbViewWidth, height: thumbViewWidth)
        thumbView.frame = thumbViewFrame
        thumbView.backgroundColor = .black
        thumbView.layer.cornerRadius = thumbViewWidth / 2
        
        addSubview(thumbView)
        
        thumbView.isUserInteractionEnabled = false
    }
    
    func thumbViewPosition(for value: CGFloat) -> CGFloat {
        return (bounds.width - thumbViewWidth - 10) * value
    }
    
    private func thumbViewFrame(for value:CGFloat) -> CGRect {
        let x = thumbViewPosition(for: value) + 6
        let y = (bounds.height - thumbViewWidth) / 2
        return CGRect(x: x, y: y, width: thumbViewWidth, height: thumbViewWidth)
    }
    
    private func updateFrames() {
        thumbView.frame = thumbViewFrame(for: thumbViewValue)
    }
    
    func reset() {
        thumbViewValue = 0.0
        isUnlocked = false
        updateFrames()
        
        self.isUserInteractionEnabled = true
    }
    
    // MARK: - Touch Handling Methods
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        if thumbView.frame.contains(previousLocation) {
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            return false
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        let deltaLocation = location.x - previousLocation.x
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / bounds.width
        previousLocation = location
        thumbViewValue = min(max((thumbViewValue + deltaValue), minimumValue), maximumValue)
        
        updateFrames()
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        
        previousLocation = touch.location(in: self)
        
        if thumbViewValue >= 0.8 {
            thumbViewValue = 1
            isUnlocked = true
            sendActions(for: [.touchUpInside, .valueChanged])
            
            UIView.animate(withDuration: 1.0) {
                self.thumbView.frame = self.thumbViewFrame(for: 1.0)
            }
        }   else {
            sendActions(for: [.touchUpInside, .valueChanged])
            isUnlocked = false
            thumbViewValue = 0
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.thumbView.frame = self.thumbViewFrame(for: 0.0)
            }, completion: nil)
        }
        updateFrames()
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
}
