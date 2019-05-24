//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Mitchell Budge on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AppearanceHelper {
    
    static let lambdaMaroon = UIColor(red: 128/255, green: 0/255, blue: 0/255, alpha: 1.0)
    static let offWhite = UIColor(red: 245/255, green: 242/255, blue: 208/255, alpha: 1.0)
    static let textAttributes = [NSAttributedString.Key.foregroundColor: offWhite]
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = lambdaMaroon
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UIBarButtonItem.appearance().tintColor = offWhite
    }
}
