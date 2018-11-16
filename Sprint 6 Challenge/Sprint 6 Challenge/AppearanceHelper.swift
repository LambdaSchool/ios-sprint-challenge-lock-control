//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Yvette Zhukovsky on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
enum Appearance {
    
    static var magenta = UIColor(red: 183/255, green: 31/255, blue: 76/255, alpha: 1.0)
    static var yellow = UIColor(red: 239/255, green: 193/255, blue: 40/255, alpha: 1.0)
    
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = magenta
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: yellow, NSAttributedStringKey.font : titleFont(with: .title2, pointSize: 30)]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
        UIBarButtonItem.appearance().tintColor = yellow
    }
    
    static func titleFont(with textStyle: UIFontTextStyle, pointSize: CGFloat) -> UIFont {
        let result = UIFont(name: "Pacifico", size: pointSize)!
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: result)
    }
}
