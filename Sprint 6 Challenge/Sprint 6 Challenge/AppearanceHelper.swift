//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Nathanael Youngren on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static var carminePink = UIColor(red: 229/255, green: 75/255, blue: 75/255, alpha: 1)
    static var vividTangerine = UIColor(red: 255/255, green: 169/255, blue: 135/255, alpha: 1)
    static var linen = UIColor(red: 247/255, green: 235/255, blue: 232/255, alpha: 1)
    static var rifleGreen = UIColor(red: 68/255, green: 65/255, blue: 64/255, alpha: 1)
    
    
    static func setTheme() {
        UINavigationBar.appearance().backgroundColor = rifleGreen
        
        let textAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: linen]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().barTintColor = rifleGreen
        
        UIBarButtonItem.appearance().setTitleTextAttributes(textAttributes, for: .normal)
        UIBarButtonItem.appearance().tintColor = rifleGreen
    }
    
}
