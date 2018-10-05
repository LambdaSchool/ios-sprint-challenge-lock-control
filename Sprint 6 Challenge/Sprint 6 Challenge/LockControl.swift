//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Dillon McElhinney on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    var isUnlocked: Bool = false
    private var imageView: UIImageView!
    private var barView: UIView!
    private var thumb: UIView!
    private let unlockedImage = UIImage(named: "Unlocked")!
    private let lockedImage = UIImage(named: "Locked")!
    
    
    func reset() {
        imageView.image = lockedImage
        slideThumb(to: 6)
        isUnlocked = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupControl()
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: thumb)
        if thumb.bounds.contains(touchPoint) {
            sendActions(for: .touchDown)
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: barView)
        if barView.bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
        } else  {
            sendActions(for: .touchDragOutside)
        }
        let percentage = calculatePercentage(with: touchPoint)
        let offset = (percentage * 178) + 6
        thumb.frame = thumbOffset(by: offset)
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: barView)
        let percentage = calculatePercentage(with: touchPoint)
        if percentage > 0.8 {
            isUnlocked = true
            imageView.image = unlockedImage
            sendActions(for: .valueChanged)
            if thumb.frame.origin.x != 184 { slideThumb(to: 184) }
        } else {
            reset()
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        reset()
    }
    
    private func setupControl() {
        backgroundColor = .lightGray
        layer.cornerRadius = 30
        
        imageView = UIImageView(frame: CGRect(x: 60, y: 46, width: 120, height: 120))
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = lockedImage
        
        barView = UIView(frame: CGRect(x: 6, y: 184, width: 228, height: 50))
        addSubview(barView)
        barView.backgroundColor = .gray
        barView.layer.cornerRadius = barView.bounds.height / 2
        barView.isUserInteractionEnabled = false
        
        thumb = UIView(frame: thumbOffset(by: 6))
        barView.addSubview(thumb)
        thumb.backgroundColor = .black
        thumb.layer.cornerRadius = thumb.bounds.height/2
        thumb.isUserInteractionEnabled = false
    }
    
    private func calculatePercentage(with point: CGPoint) -> CGFloat {
        var percentage = point.x / (barView.bounds.width)
        if percentage > 1.0 {
            percentage = 1.0
        } else if percentage < 0.0 {
            percentage = 0.0
        }
        return percentage
    }
    
    private func thumbOffset(by offset: CGFloat) -> CGRect {
        return CGRect(x: offset, y: 6, width: 38, height: 38)
    }
    
    private func slideThumb(to point: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.thumb.frame = self.thumbOffset(by: point)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let size = CGSize(width: 240.0, height: 240.0)
        return size
    }
}
