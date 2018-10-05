//
//  Appearance.swift
//  Sprint 6 Challenge
//
//  Created by Daniela Parra on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    
    static let paleYellow = UIColor(red: 235/255.0, green: 215/255.0, blue: 142/255.0, alpha: 1.0)
    
    static func setTheme() {
        UINavigationBar.appearance().barTintColor = Appearance.paleYellow
        
        let titleFont = Appearance.setTitleFont(with: .title1, pointSize: 40)
        let titleAttributes = [NSAttributedString.Key.font: titleFont]
        
        UINavigationBar.appearance().titleTextAttributes = titleAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = titleAttributes
        
        let barButtonFont = Appearance.setTitleFont(with: .title1, pointSize: 20)
        let barButtonFontAttributes = [NSAttributedString.Key.font: barButtonFont]
        
        
        UIBarButtonItem.appearance().tintColor = Appearance.paleYellow
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonFontAttributes, for: .normal)
        
    }
    
    static func setTitleFont(with textStyle: UIFontTextStyle, pointSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Bebas Neue", size: pointSize) else {
            fatalError("The font wasn't found. Check the name again.")
        }
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
}
