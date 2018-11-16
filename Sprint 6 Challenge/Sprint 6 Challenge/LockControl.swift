//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Jerrick Warren on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class LockControl: UIControl {
    
    // iniitializers
    // set up func
    // tracking funcitons
    // animation of lock and little slider thingy
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupControl()
    }
    
    
    private func setupControl() {
        // make each item a layer , like in photoshop
        // image layer(lock),
    }
    
    
    // MARK: - UI Control
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        <#code#>
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        <#code#>
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        <#code#>
    }
    
    override func cancelTracking(with event: UIEvent?) {
        <#code#>
    }
    
}
