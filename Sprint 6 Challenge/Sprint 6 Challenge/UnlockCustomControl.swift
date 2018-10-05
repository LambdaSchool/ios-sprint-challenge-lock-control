//
//  UnlockCustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Daniela Parra on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class UnlockCustomControl: UIControl {
    
    
//    required init?(coder aCoder: NSCoder) {
//        super.init(coder: aCoder)
//
//        setUp()
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUp()
    }

    private func setUp() {
        lockImageView.image = UIImage(named: "Locked")
        lockImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 3 * self.bounds.height / 4)
        lockImageView.contentMode = .scaleAspectFit
        views.append(lockImageView)
        addSubview(lockImageView)
        
        
        slider.frame = CGRect(x: 0, y: lockImageView.bounds.height, width: self.bounds.width, height: self.bounds.height / 4)
        slider.backgroundColor = UIColor.gray
        slider.layer.cornerRadius = 20
        views.append(slider)
        addSubview(slider)
        
        indicator.frame = CGRect(x: 10, y: slider.frame.origin.y + 10, width: slider.frame.height - 20, height: slider.frame.height - 20)
        indicator.backgroundColor = UIColor.black
        indicator.layer.cornerRadius = indicator.frame.height / 2
        views.append(indicator)
        addSubview(indicator)
    }
    
    private func updatePercent(with touchPoint: CGPoint) {
        
        guard let indicator = views.last else { return }
        let slider = views[1]
        
        
        let sliderWidth = slider.bounds.width
        let start = indicator.frame.width + 10
        let end = sliderWidth - 10
        
        let dx = touchPoint.x - start
        
        percentComplete = Double(dx / end - start)
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
//        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if slider.bounds.contains(touchPoint) {
            updatePercent(with: touchPoint)
            indicator.frame = CGRect(x: touchPoint.x, y: indicator.frame.origin.y, width: indicator.frame.width, height: indicator.frame.height
            )
            
            print(touchPoint)
            sendActions(for: [.touchDragInside, .valueChanged])
            
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if slider.bounds.contains(touchPoint) {
            updatePercent(with: touchPoint)
            
            sendActions(for: [.touchUpInside, .valueChanged])
            
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    var lockImageView = UIImageView()
    var slider = UIView()
    var indicator = UIView()
    
    var views: [UIView] = []
    var percentComplete: Double = 0.0
}
