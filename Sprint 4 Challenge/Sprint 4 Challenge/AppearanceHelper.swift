//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Kobe McKee on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


enum AppearanceHelper {
    
    static let backgroundColor = UIColor(red: 185 / 255, green: 241 / 255, blue: 140 / 255, alpha: 1.0)
    static let highlightColor = UIColor(red: 25 / 255, green: 99 / 255, blue: 94 / 255, alpha: 1.0)
    
    
    static func setAppearance() {
        
        UINavigationBar.appearance().barTintColor = backgroundColor
        UINavigationBar.appearance().tintColor = highlightColor
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: highlightColor]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: highlightColor]
        
        
    }
    
    
}
