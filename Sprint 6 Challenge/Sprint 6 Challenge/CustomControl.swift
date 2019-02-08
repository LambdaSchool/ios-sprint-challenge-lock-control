//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Michael Flowers on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value = 0.0
    
    required init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
        setup()
    }
    
    func setup(){
        
    }
    
    func updateValue(at touch: UITouch){
        let oldValue = value
        
    }
}
