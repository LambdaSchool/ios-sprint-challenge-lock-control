//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Lisa Sampson on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    
    static var purple = UIColor(red: 173.0/255.0, green: 66.0/255.0, blue: 235.0/255.0, alpha: 1.0)
    static var pink = UIColor(red: 255.0/255.0, green: 114.0/255.0, blue: 180.0/255.0, alpha: 1.0)
    
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = purple
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: pink, NSAttributedStringKey.font : titleFont(with: .title2, pointSize: 30)]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
        UIBarButtonItem.appearance().tintColor = pink
    }
    
    static func titleFont(with textStyle: UIFontTextStyle, pointSize: CGFloat) -> UIFont {
        let result = UIFont(name: "Avenir next", size: pointSize)!
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: result)
    }
}
