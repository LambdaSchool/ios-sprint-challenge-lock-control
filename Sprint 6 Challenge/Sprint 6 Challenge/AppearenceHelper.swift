//
//  AppearenceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Christopher Aronson on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    static var mainColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static var textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = mainColor
        UIBarButtonItem.appearance().tintColor = textColor
    }
}
