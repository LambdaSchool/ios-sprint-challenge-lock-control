//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Ivan Caldwell on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: CGFloat = 1.0
    let slider = UIView(frame: CGRect(x: 15, y: 320, width: 280, height: 40))
    static var thumb = UIView(frame: CGRect(x: 17, y: 320, width: 40, height: 40))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setAppearance()
    }
    
    func setAppearance() {
        self.layer.cornerRadius = 30
        //slider.center.x = (superview?.center.x)!
        slider.backgroundColor = UIColor.darkGray
        slider.layer.cornerRadius = slider.frame.height / 2
        CustomControl.thumb.backgroundColor = UIColor.black
        CustomControl.thumb.layer.cornerRadius = CustomControl.thumb.frame.height / 2
        addSubview(slider)
        addSubview(CustomControl.thumb)
        CustomControl.thumb.isUserInteractionEnabled = false
    }
    
    
    
}
