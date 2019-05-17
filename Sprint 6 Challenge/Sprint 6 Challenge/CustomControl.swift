//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Christopher Aronson on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: CGFloat = 0.0
    
    private let thumbViewSize: CGFloat = 60
    private let cornerRadius: CGFloat = 30
    private let thumbViewColor = UIColor.black
    
    private let startingPosition = CGRect(x: 8, y: 7, width: 60, height: 60)
    
    private var thumbView = UIView()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.clipsToBounds = true
        
        setup()
    }
    
    
    
    // MARK: - Private Functions
    
    private func setup() {
        
        thumbView.frame = CGRect(x: 8, y: 7, width: thumbViewSize, height: thumbViewSize)
        thumbView.layer.cornerRadius = cornerRadius
        thumbView.backgroundColor = thumbViewColor
        thumbView.isUserInteractionEnabled = false
        
        addSubview(thumbView)
    }
    
    private func updateValue(at touch: UITouch) {
        print("Touched view")
        let touchPoint = touch.location(in: self)
        
        value = touchPoint.x / bounds.width
        
        thumbView.frame = CGRect(x: touchPoint.x, y: 7, width: thumbViewSize, height: thumbViewSize)
        
        sendActions(for: .valueChanged)
    }
    
    // MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
        sendActions(for: .touchCancel)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
