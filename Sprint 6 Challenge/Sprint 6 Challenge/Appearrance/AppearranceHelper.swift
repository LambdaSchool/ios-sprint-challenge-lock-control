//
//  Appearrance.swift
//  Sprint 6 Challenge
//
//  Created by Moses Robinson on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AppearanceHelper {
    
    // MARK: - Theme Colors
    
    static var backgroundBlue = UIColor(red:0.65, green:0.69, blue:0.74, alpha:1.00)
    static var paperWhite = UIColor(red:0.95, green:0.95, blue:0.93, alpha:1.00)
    static var lockGreen = UIColor(red:0.44, green:0.56, blue:0.53, alpha:1.00)
    static var circleYellow = UIColor(red:0.97, green:0.82, blue:0.39, alpha:1.00)
    
    // MARK: - Fonts
    
    static let titleFont = UIFont(name: "jabjai", size: 60)!
    
    //MARK: - Theme Setup
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = backgroundBlue
        UIBarButtonItem.appearance().tintColor = paperWhite
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: paperWhite, NSAttributedString.Key.font: titleFont]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
    }
}
