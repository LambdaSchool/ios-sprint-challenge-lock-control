//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Nathanael Youngren on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    var value: Int = 0
    var minValue: Int = 0
    var maxValue: Int = 0
    
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
    
}
