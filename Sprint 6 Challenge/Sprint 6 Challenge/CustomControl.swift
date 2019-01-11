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
    
    private func setup(){
        
        
        self.layer.cornerRadius = 30
        self.backgroundColor = .gray
        print(self.center)
        let lockImageView = UIImageView(frame: CGRect(x: self.bounds.midX/2, y: self.bounds.midY/2 - 20, width: self.bounds.width/2, height: self.bounds.height/2))
        lockImageView.image = UIImage(named: "Locked")
        lockImageView.contentMode = .scaleAspectFit
        self.addSubview(lockImageView)
        
        let sliderBackground = UIView(frame: CGRect(x: 8.0, y: self.bounds.height - 58.0, width: self.bounds.width - 16.0, height: 50.0))
        sliderBackground.layer.cornerRadius = 25
        sliderBackground.backgroundColor = .white
        self.addSubview(sliderBackground)
        
        let thumbView = UIView(frame: CGRect(x: 14.0, y: self.bounds.height - 51.0, width: 36, height: 36))
        thumbView.layer.cornerRadius = 18
        thumbView.backgroundColor = .black
        self.addSubview(thumbView)
        
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        updateValue(at: touch)
        sendActions(for: [.touchDown,.valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        defer {
            super.endTracking(touch, with: event)
        }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
            // TODO: Implement func
            updateValue(at: touch)
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
        
        if bounds.contains(touchPoint){
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    func updateValue(at touch: UITouch) {
        
        let touchPoint = touch.location(in: self)
        print(touchPoint)
        for index in 0..<labelArray.count {
            
            
            if labelArray[index].frame.contains(touchPoint){
                value = labelArray[index].tag
                print(value)
                sendActions(for: [.valueChanged])
                print(labelArray[index].frame)
                for label in labelArray {
                    
                    if label.tag <= index + 1{
                        label.textColor = componentInactiveColor
                    } else {
                        label.textColor = componentActiveColor
                    }
                }
                
                
            }
            
        }
        
    }
    
}
