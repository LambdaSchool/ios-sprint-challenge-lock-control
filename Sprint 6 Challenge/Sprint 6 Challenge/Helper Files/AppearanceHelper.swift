//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Nelson Gonzalez on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Appearance {
    
    // Custom Font
    static let customFont = UIFont(name: "Carbon", size: 40)
    
    // Scalable font
    static func scaledFont(with textStyle: UIFont.TextStyle, size: CGFloat) -> UIFont {
        guard let font = customFont else { fatalError() }
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
        
    }
    
    static func setupTheme() {
        
        // Navigation Bar
        UINavigationBar.appearance().barTintColor = .lightBlue
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.grayishColor, NSAttributedString.Key.font: customFont]
        
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
    }
}
