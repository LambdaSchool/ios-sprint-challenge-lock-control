//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Dillon McElhinney on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    // MARK: - Properties
    var isUnlocked: Bool = false
    private var imageView: UIImageView!
    private var barView: UIView!
    private var thumb: UIView!
    private let unlockedImage = UIImage(named: "Unlocked")!
    private let lockedImage = UIImage(named: "Locked")!
    
    // MARK: - Public API
    /// Resets the lock control back to its original state.
    func reset() {
        imageView.image = lockedImage
        slideThumb(to: 6)
        isUnlocked = false
    }
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupControl()
    }
    
    // MARK: - UI Control
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // Only begin tracking if the user touches down inside of the thumb
        let touchPoint = touch.location(in: thumb)
        if thumb.bounds.contains(touchPoint) {
            sendActions(for: .touchDown)
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // Send the proper action if the user drags inside or outside of the slider bar
        let touchPoint = touch.location(in: barView)
        if barView.bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
        } else  {
            sendActions(for: .touchDragOutside)
        }
        // But update the thumb's position no matter where they drag.
        let percentage = calculatePercentage(with: touchPoint)
        let offset = (percentage * 178) + 6
        thumb.frame = thumbOffset(by: offset)
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        // Make sure there is a touch and that the lock is not already unlocked
        guard let touch = touch, !isUnlocked else { return }
        // Calculate the percentage through the slider bar
        let touchPoint = touch.location(in: barView)
        let percentage = calculatePercentage(with: touchPoint)
        if percentage > 0.8 {
            // If it is more than 80 percent, unlock the control, update the image and send the action.
            isUnlocked = true
            imageView.image = unlockedImage
            sendActions(for: .valueChanged)
            if thumb.frame.origin.x != 184 { slideThumb(to: 184) }
        } else {
            // Otherwise, reset it.
            reset()
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        // If tracking is cancelled, send that action and reset the control.
        sendActions(for: .touchCancel)
        reset()
    }
    
    override var intrinsicContentSize: CGSize { return CGSize(width: 240.0, height: 240.0) }
    
    // MARK: - Utility Methods
    /// Sets up a new Lock Control
    private func setupControl() {
        // Set the background color and corner radius of control
        backgroundColor = .darkerColor
        layer.cornerRadius = 30
        
        // Set up the image view for the lock
        imageView = UIImageView(frame: CGRect(x: 60, y: 46, width: 120, height: 120))
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = lockedImage
        
        // Set up the view for the slider bar
        barView = UIView(frame: CGRect(x: 6, y: 184, width: 228, height: 50))
        addSubview(barView)
        barView.backgroundColor = .darkColor
        barView.layer.cornerRadius = barView.bounds.height / 2
        barView.isUserInteractionEnabled = false
        
        // Set up the view for the thumb
        thumb = UIView(frame: thumbOffset(by: 6))
        barView.addSubview(thumb)
        thumb.backgroundColor = .darkerColor
        thumb.layer.cornerRadius = thumb.bounds.height/2
        thumb.layer.borderColor = UIColor.accentColor.cgColor
        thumb.layer.borderWidth = 2
        thumb.isUserInteractionEnabled = false
    }
    
    /// Calculates a percentage travelled within the slider bar, with provisions for travelling beyond it.
    private func calculatePercentage(with point: CGPoint) -> CGFloat {
        var percentage = point.x / (barView.bounds.width)
        if percentage > 1.0 {
            percentage = 1.0
        } else if percentage < 0.0 {
            percentage = 0.0
        }
        return percentage
    }
    
    /// Returns the new frame for the thumb offest by the given point.
    private func thumbOffset(by offset: CGFloat) -> CGRect {
        return CGRect(x: offset, y: 6, width: 38, height: 38)
    }
    
    /// Animates the thumb sliding to the given point.
    private func slideThumb(to point: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.thumb.frame = self.thumbOffset(by: point)
        }
    }
}
