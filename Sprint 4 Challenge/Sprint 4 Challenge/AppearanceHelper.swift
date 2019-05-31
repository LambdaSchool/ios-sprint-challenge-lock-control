//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Thomas Cacciatore on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    static var specialGreen = UIColor(red: 80.0/255.0, green: 212.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    static var backgroundRed = UIColor(red: 200.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 1.0)
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = backgroundRed
        UIBarButtonItem.appearance().tintColor = specialGreen
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
    }
}
