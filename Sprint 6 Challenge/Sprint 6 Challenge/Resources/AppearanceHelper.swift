//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Andrew Dhan on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    
    static let lightBlue = UIColor(displayP3Red: 240/256, green: 248/255, blue: 1, alpha: 1.0)
    static let lightSteelBlue = UIColor(displayP3Red: 176/255, green: 196/255, blue: 222/255, alpha: 1.0)
    static let midnightBlue = UIColor(displayP3Red: 25/255, green: 25/255, blue: 112/255, alpha: 1.0)
    static let steelBlue = UIColor(displayP3Red: 70, green: 130, blue: 180, alpha: 1.0)
    
    static func setTheme(){
        UINavigationBar.appearance().barTintColor = lightSteelBlue
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: midnightBlue], for: .normal)
    }
}
