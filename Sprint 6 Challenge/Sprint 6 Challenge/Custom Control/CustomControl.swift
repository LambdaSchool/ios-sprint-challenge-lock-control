//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Nelson Gonzalez on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    // MARK: - Properties
    
    // The sliders minimum value
    var minimumValue: CGFloat = 0
    
    // Maximinum value of slider
    var maximumValue: CGFloat = 1
    
    // Slider circle starting point value
    var sliderCircleValue: CGFloat = 0.0
    
    
    var isUnlocked: Bool = false
    
    // MARK: - Views
    
    // Slider circle view
    private var sliderCircleView = UIView()
    
    private var previousLocation = CGPoint()
    
    // Sets slider circle view to be 80% of the height of the Slider View
    private var sliderCircleWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupSliderCircle(sliderCircleView)
        
        updateControlFrames()
        
    }
    
    func reset() {
        
        // Update thumbValue
        sliderCircleValue = 0.0
        
        updateControlFrames()
        
        // Reset isUnlocked
        isUnlocked = false
        
        // Enable user interaction
        self.isUserInteractionEnabled = true
        
    }
    
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Get location of touch
        previousLocation = touch.location(in: self)
        
        // Check to see if the touch is inside the thumbView
        if sliderCircleView.frame.contains(previousLocation) {
            
            sendActions(for: [.touchDown, .valueChanged])
            
        } else {
            return false
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let location = touch.location(in: self)
        
        let locationChange = location.x - previousLocation.x
        
        // Calculate how far the touch is moving
       
        let valueChange = (maximumValue - minimumValue) * locationChange / bounds.width
        
        // Reset current location
        previousLocation = location
        
        // Update the circle Value so it can't go lower or higher than the min and max
        sliderCircleValue = min(max((sliderCircleValue + valueChange), minimumValue), maximumValue)
        
        updateControlFrames()
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        // Call super before the function ends
        defer { super.endTracking(touch, with: event) }
        
        // Touch is optional because you may or may not get a touch
        guard let touch = touch else { return }
        
        // Get current location
        previousLocation = touch.location(in: self)
        
        
        // If so, set is Unlocked and sendActions(for: .valueChanged)
        if sliderCircleValue > 0.8 {
            sliderCircleValue = 1
            isUnlocked = true
            sendActions(for: [.touchUpInside, .valueChanged])
            
            UIView.animate(withDuration: 1.0) {
                self.sliderCircleView.frame = self.sliderCircleFrame(for: 1.0)
            }
            
            
        } else {
            sendActions(for: [.touchUpInside, .valueChanged])
            isUnlocked = false
            sliderCircleValue = 0
            
            UIView.animate(withDuration: 2.0) {
                self.sliderCircleView.frame = self.sliderCircleFrame(for: 0.0)
            }
        }
        
        updateControlFrames()
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
    
    
    
    // MARK: - Utility Methods
    
    // Set up the circle slide thumbnail
    private func setupSliderCircle( _ sliderCircle: UIView) {
        
        // Give initial frame
        let sliderCircleFrame = CGRect(x: 0, y: 0, width: sliderCircleWidth, height: sliderCircleWidth)
        // Give the frame to the thumb
        sliderCircle.frame = sliderCircleFrame
        //Set Appearance
        sliderCircle.backgroundColor = .darkGray
        sliderCircle.layer.cornerRadius = sliderCircleWidth / 2
        sliderCircle.layer.borderColor = UIColor.white.cgColor
        sliderCircle.layer.borderWidth = 1
        
        // Makes it possible to move the thumb circle around
        sliderCircle.isUserInteractionEnabled = false
        
        // Add as a subview
        addSubview(sliderCircle)
    }
    
    
    private func updateControlFrames() {
        
        // Set the position of the thumb
        sliderCircleView.frame = sliderCircleFrame(for: sliderCircleValue)
    }
    
    
    // Called when we need to update the position of the slider circle and it gives the frame we need to put it in based on a value.
    private func sliderCircleFrame(for value: CGFloat) -> CGRect {
        
        // This gives us the center of the slider to be where the value is
        // Offset it by 6 pixels in from the leading
        let x = position(for: value) + 6
        
        let y = (bounds.height - sliderCircleWidth)/2
        
        return CGRect(x: x, y: y, width: sliderCircleWidth, height: sliderCircleWidth)
    }
    
    
    // Gives the position based on the value
    func position(for value: CGFloat) -> CGFloat {
        // Put the circle in a position in the view based on the value I'm giving it from 0 to 1
        // Reduce it by the width of the circle, and an extra 12 pixels of padding
        return (bounds.width - sliderCircleWidth - 12) * value
    }
    
}
