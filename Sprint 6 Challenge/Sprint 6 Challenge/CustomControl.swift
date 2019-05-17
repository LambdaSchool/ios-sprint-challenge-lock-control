//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Christopher Aronson on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value = 0.0
    
    private let thumbViewSize: CGFloat = 60
    private let cornerRadius: CGFloat = 30
    private let thumbViewColor = UIColor.black
    
    private var thumbView: UIView?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - Private Functions
    
    private func setup() {
        
        thumbView = UIView(frame: CGRect(x: 8, y: 7, width: thumbViewSize, height: thumbViewSize))
        thumbView?.layer.cornerRadius = cornerRadius
        thumbView?.backgroundColor = thumbViewColor
        
        addSubview(thumbView!)
    }
    
    // MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
    }
    
    override func cancelTracking(with event: UIEvent?) {

    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
