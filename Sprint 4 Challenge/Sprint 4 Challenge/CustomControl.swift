//
//  CustomControl.swift
//  Sprint 4 Challenge
//
//  Created by Thomas Cacciatore on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    var minValue: CGFloat = 0
    var maxValue: CGFloat = 1
    var lowerValue: CGFloat = 0.1
    var higherValue: CGFloat = 0.9

    private let trackLayer = SliderLayer()
    private let lowerThumb = UIView()
    private var activeThumb: UIView?
    private var previousLocation = CGPoint()
    
    private var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        trackLayer.customControl = self
        trackLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(trackLayer)
        
        setupThumb(lowerThumb)
        
        updateControlFrames()
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        if lowerThumb.frame.contains(previousLocation) {
            activeThumb = lowerThumb
        }
        return activeThumb != nil
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        let locationChange = location.x - previousLocation.x
        let valueChange = (maxValue - minValue) * locationChange / bounds.width
        
        previousLocation = location
        
        guard let activeThumb = activeThumb else { return false }
        
        if activeThumb == lowerThumb {
            lowerValue = bound(value: (lowerValue + valueChange), to: minValue, and: higherValue)
            if lowerValue >= 0.9 {
                touch.view?.isUserInteractionEnabled = false
                endTracking(touch, with: event)
            }
    
        }
        updateControlFrames()
        
        sendActions(for: .valueChanged)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        activeThumb = nil
        super.endTracking(touch, with: event)
        if lowerValue <= 0.89 {
            lowerValue = 0.1
        }
        UIView.animate(withDuration: 0.4) {
            self.updateControlFrames()
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        activeThumb = nil
        super.cancelTracking(with: event)
    }
    
    private func setupThumb(_ thumb: UIView) {
        let thumbFrame = CGRect(x: 0, y: 0, width: thumbWidth, height: thumbWidth)
        
        thumb.frame = thumbFrame
        thumb.backgroundColor = .black
        thumb.layer.cornerRadius = thumb.frame.height / 2
        thumb.layer.borderColor = UIColor.white.cgColor
        thumb.layer.borderWidth = 1
        thumb.isUserInteractionEnabled = false
        
        addSubview(thumb)
    }
    
    
    private func updateControlFrames() {
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height/3)
        trackLayer.setNeedsDisplay()
        
        lowerThumb.frame = thumbFrame(for: lowerValue)
        
    }
    
//    func reset() {
//      lowerValue = 0.1
//        updateControlFrames()
//        
//    }
    
    private func thumbFrame(for value: CGFloat) -> CGRect {
        let x = position(for: value) - thumbWidth/2
        let y = (bounds.height - thumbWidth)/2
        return CGRect(x: x, y: y, width: thumbWidth, height: thumbWidth)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return bounds.width * value
    }
    
    private func bound(value: CGFloat, to lowerValue: CGFloat, and upperValue: CGFloat) -> CGFloat {
        return min(max(value, lowerValue), upperValue)
    }
    
    
}
