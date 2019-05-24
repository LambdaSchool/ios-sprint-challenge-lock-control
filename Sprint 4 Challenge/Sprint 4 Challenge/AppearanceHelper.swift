//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Sameera Roussi on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum AppearanceHelper {
    
    // Default colors
    static var navbarBrown = UIColor(red: 72.0/256.0, green: 38.0/256.0, blue: 3.0/256.0, alpha: 1.0)
    static var lightBrown = UIColor(red: 243.0/256.0, green: 237.0/256.0, blue: 222.0/256.0, alpha: 1.0)
    static var barelyBrown = UIColor(red: 249.0/256.0, green: 248.0/256.0, blue: 240.0/256.0, alpha: 1.0)
    static var navItemBrown = UIColor(red: 245.0/256.0, green: 236.0/256.0, blue: 222.0/256.0, alpha: 1.0)
    
    
    
    // Default styling
    static func setDefaultAppearance() {
        UINavigationBar.appearance().barTintColor = navbarBrown
        UIBarButtonItem.appearance().tintColor = navItemBrown
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: lightBrown]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
        
    }
}


