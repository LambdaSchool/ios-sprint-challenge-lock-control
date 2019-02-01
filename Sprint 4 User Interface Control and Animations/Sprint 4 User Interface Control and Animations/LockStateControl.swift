//
//  LockStateControl.swift
//  Sprint 4 User Interface Control and Animations
//
//  Created by Jaspal on 2/1/19.
//  Copyright © 2019 Jaspal Suri. All rights reserved.
//

import UIKit

class LockStateControl: UIControl {
    
    // true = locked
    // false = unlocked
    static var lockState: Bool = true
    
    func changeState(_ lockState: Bool) {
        var lockImage: UIImage
        if lockState == true {
            lockImage = UIImage(named: "Locked")!
        } else if lockState == false {
            lockImage = UIImage(named: "Unlocked")!
        }
    }
    
    // MARK: Lock Slider Properties
    
    var initialPosition: CGFloat = 0
    var minBound: CGFloat = 0
    var maxBound: CGFloat = 0
    var percentProgress: CGFloat = 0
    // Can't set it to 0.8 * percentProgress Yet
    let eightyPercentThreshold: CGFloat = 0
    
}
