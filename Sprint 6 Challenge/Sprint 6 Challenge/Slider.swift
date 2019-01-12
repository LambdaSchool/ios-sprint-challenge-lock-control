//
//  Slider.swift
//  Sprint 6 Challenge
//
//  Created by Lotanna Igwe-Odunze on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class SpecialSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 40.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
    
}
