//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Lambda-School-Loaner-11 on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Lock Switch Value
    
    func updateValue(at touch: UITouch) {
        
        sendActions(for: .valueChanged)
    }
    
    // Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        return true
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }
    
    // Constraints
    
    func setUp() {
        
    }
}

