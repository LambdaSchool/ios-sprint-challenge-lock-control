//
//  SwipeUnlocker.swift
//  Sprint 6 Challenge
//
//  Created by Farhan on 3/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import QuartzCore

class SwipeUnlocker: UIControl {

    var previousLocation = CGPoint()
    
    var minimumValue = 0.0
    var maximumValue = 100.0
    var lowerValue = 0.0 {
        didSet{
            print(lowerValue)
        }
    }
    var upperValue = 100.0
    
    let trackLayer = CALayer()
    let lowerThumbLayer = RangeSliderThumbLayer()
//    let upperThumbLayer = RangeSliderThumbLayer()
//    let upperThumbLayer = CALayer()
    
    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.backgroundColor = UIColor.darkGray.cgColor
        trackLayer.contents =
        layer.addSublayer(trackLayer)
        
//        lowerThumbLayer.contents = UIImage(named: "Locked")?.cgImage
//        lowerThumbLayer.backgroundColor = UIColor.black.cgColor
        let radius = CGFloat(15.0)
        lowerThumbLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).cgPath
        lowerThumbLayer.position = CGPoint(x: self.frame.midX - radius, y: self.frame.midY - radius)
        lowerThumbLayer.fillColor = UIColor.black.cgColor
//        lowerThumbLayer.cornerRadius = lowerThumbLayer.bounds.height / 2
        
        
        
        layer.addSublayer(lowerThumbLayer)
        
        lowerThumbLayer.rangeSlider = self
        
//        upperThumbLayer.backgroundColor = UIColor.greenColor().CGColor
//        layer.addSublayer(upperThumbLayer)
        
        updateLayerFrames()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateLayerFrames() {
        trackLayer.frame = bounds.offsetBy(dx: 0.0, dy: bounds.height/3)
        trackLayer.setNeedsDisplay()
        
        let lowerThumbCenter = CGFloat(positionForValue(value: lowerValue))
//
        lowerThumbLayer.frame = CGRect(x: lowerThumbCenter - thumbWidth / 2.0, y: 0.0,
                                       width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsDisplay()
//
//        let upperThumbCenter = CGFloat(positionForValue(upperValue))
//        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth / 2.0, y: 0.0,
//                                       width: thumbWidth, height: thumbWidth)
//        upperThumbLayer.setNeedsDisplay()
    }
    
    func positionForValue(value: Double) -> Double {
        return Double(bounds.width - thumbWidth) * (value - minimumValue) /
            (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        if lowerThumbLayer.frame.contains(previousLocation) {
            lowerThumbLayer.highlighted = true
        }
        
        return lowerThumbLayer.highlighted
    }
    
    func boundValue(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        // 1. Determine by how much the user has dragged
        let deltaLocation = Double(location.x - previousLocation.x)
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / Double(bounds.width - thumbWidth)
        
        previousLocation = location
        
        if lowerThumbLayer.highlighted {
            lowerValue += deltaValue
            lowerValue = boundValue(value: lowerValue, toLowerValue: minimumValue, upperValue: upperValue)
        }
        
        // 3. Update the UI
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        updateLayerFrames()
        
        CATransaction.commit()
        
        sendActions(for: .valueChanged)
        return true
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
        sendActions(for: .touchCancel)
        
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbLayer.highlighted = false
    }



    

}
