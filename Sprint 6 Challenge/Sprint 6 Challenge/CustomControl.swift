//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Benjamin Hakes on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1 {
        didSet {
            
        }
    }
    
    var locked: Int = 1 {
        didSet {
        
        }
    }
    private var labelArray: [UILabel] = []
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
        
        setup()
    }
    
    func reset(){
        for subview in self.subviews {
            if subview.tag == 1 {
                snapBack(for: subview)
            }
        }
        locked = 1
        lockPicture()
    }
    
    private func setup(){
        
        
        self.layer.cornerRadius = 30
        self.backgroundColor = .gray
        
        
        let lockImageView = UIImageView(frame: CGRect(x: self.bounds.midX/2, y: self.bounds.midY/2 - 20, width: self.bounds.width/2, height: self.bounds.height/2))
        lockImageView.image = UIImage(named: "Locked")
        lockImageView.contentMode = .scaleAspectFit
        lockImageView.tag = 2
        self.addSubview(lockImageView)
        
        let sliderBackground = UIView(frame: CGRect(x: 8.0, y: self.bounds.height - 58.0, width: self.bounds.width - 16.0, height: 50.0))
        sliderBackground.layer.cornerRadius = 25
        sliderBackground.backgroundColor = .white
        sliderBackground.isUserInteractionEnabled = false
        self.addSubview(sliderBackground)
        
        let thumbView = UIView(frame: CGRect(x: 14.0, y: self.bounds.height - 51.0, width: 36, height: 36))
        thumbView.layer.cornerRadius = 18
        thumbView.backgroundColor = .black
        thumbView.isUserInteractionEnabled = false
        thumbView.tag = 1
        
        self.addSubview(thumbView)
        
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        for subview in self.subviews {
            if subview.tag == 1 {
                if subview.frame.contains(touchPoint){
                    updateValue(at: touch, for: subview)
                    sendActions(for: [.touchDown])
                    return true
                }
            }
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        defer {
            super.endTracking(touch, with: event)
        }
        
        let touchPoint = touch.location(in: self)
        
        for subview in self.subviews {
            if subview.tag == 1 {
                if subview.frame.contains(touchPoint){
                    updateValue(at: touch, for: subview)
                    if(subview.center.x > 185){
                        locked = 0
                        snapToUnlockedPosition(for: subview)
                        unlockPicture()
                    }
                    sendActions(for: [.touchDown])
                    return true
                } else {
//                    snapBack(for: subview)
                    sendActions(for: [.touchDragOutside])
                }
            }
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        for subview in self.subviews {
            if subview.tag == 1 {
                if(subview.center.x > 185){
                    locked = 0
                    snapToUnlockedPosition(for: subview)
                    sendActions(for: [.touchUpInside, .valueChanged])
                } else {
                    snapBack(for: subview)
                    sendActions(for: [.touchUpOutside])
                }
            }
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    func updateValue(at touch: UITouch, for subview: UIView) {
        
        let touchPoint = touch.location(in: self)
        
        if touchPoint.x > 14 + subview.bounds.width/2 && touchPoint.x < self.bounds.width - 14.0 - subview.bounds.width/2 {
            subview.center.x = touchPoint.x
        }
        sendActions(for: [.valueChanged])
        
    }
    
    func snapBack(for subview: UIView){
        
        UIView.animate(withDuration: 0.5, animations: {
            subview.center = CGPoint(x: 14 + subview.bounds.width/2 , y: subview.center.y)
        })
        
    }
    
    func snapToUnlockedPosition(for subview: UIView){
        
        UIView.animate(withDuration: 0.2, animations: {
            subview.center = CGPoint(x: self.bounds.width - 14.0 - subview.bounds.width/2 , y: subview.center.y)
        })
        
    }
    
    func unlockPicture(){
        
        for subview in self.subviews{
            if subview .isKind(of: UIImageView.self){
                guard let imageView = subview as? UIImageView else { return }
                imageView.image = UIImage(named: "Unlocked")
            
            }
        }
    }
    
    func lockPicture(){
        
        for subview in self.subviews{
            if subview .isKind(of: UIImageView.self){
                guard let imageView = subview as? UIImageView else { return }
                imageView.image = UIImage(named: "Locked")
                
            }
        }
    }
    
}
