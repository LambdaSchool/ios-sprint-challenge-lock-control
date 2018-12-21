//
//  CustomSlider.swift
//  Sprint 6 Challenge
//
//  Created by Lotanna Igwe-Odunze on 12/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        
        //keeps original origin and width, changes height, you get the idea
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 40.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
}
