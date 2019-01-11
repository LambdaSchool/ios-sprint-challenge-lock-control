//
//  Layout background.swift
//  Sprint 6 Challenge
//
//  Created by Sergey Osipyan on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class Radius: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        
    }
}
