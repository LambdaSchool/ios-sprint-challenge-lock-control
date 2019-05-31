//
//  UIColor & CustomColors.swift
//  Lock(Sprint 4)
//
//  Created by Jordan Davis on 5/30/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static let smokeGray = UIColor(214, 214, 214)
    static let marvelRed = UIColor(137, 10, 24)
}
