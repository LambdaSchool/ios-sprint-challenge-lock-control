//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Michael Stoffer on 6/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    static var ironManRed = UIColor(red: 176.0/255.0, green: 54.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    static var ironManGold = UIColor(red: 240.0/255.0, green: 202.0/255.0, blue: 137.0/255.0, alpha: 1.0)
    static var slightWhite = UIColor(red: 245.0/255.0, green: 254.0/255.0, blue: 255.0/255.0, alpha: 1.0)

    static func archReactorFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        let font = UIFont(name: "CGF Arch Reactor", size: pointSize)!
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    static func setIronManTheme() {
        UINavigationBar.appearance().barTintColor = ironManRed
        UIBarButtonItem.appearance().tintColor = ironManGold
        UITextField.appearance().tintColor = ironManRed
        UITextView.appearance().tintColor = ironManRed
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: ironManGold, NSAttributedString.Key.font: archReactorFont(with: .largeTitle, pointSize: 18)]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
    }
}
