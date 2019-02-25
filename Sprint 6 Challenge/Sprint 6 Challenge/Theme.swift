//
//  Theme.swift
//  Sprint 6 Challenge
//
//  Created by Lotanna Igwe-Odunze on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Theme {
    
    //#476A6F
    static let deepSpaceSparkle = UIColor(red:0.28, green:0.42, blue:0.44, alpha:1.0)
    
    //#519E8A
    static let polishedPine = UIColor(red:0.32, green:0.62, blue:0.54, alpha:1.0)
    
    //#7EB09B
    static let greenSheen = UIColor(red:0.49, green:0.69, blue:0.61, alpha:1.0)
    
    //#C5C9A4
    static let darkVanilla = UIColor(red:0.77, green:0.79, blue:0.64, alpha:1.0)
    
    //#ECBEB4
    static let desertSand = UIColor(red:0.93, green:0.75, blue:0.71, alpha:1.0)
    
    static func changeAppearance() {
        UINavigationBar.appearance().barTintColor = deepSpaceSparkle
        UINavigationBar.appearance().backgroundColor = darkVanilla
        UINavigationBar.appearance().tintColor = greenSheen
    }
    static func changeTitleLook() {
        
        let navBarText = [NSAttributedStringKey.foregroundColor: desertSand]
        UINavigationBar.appearance().titleTextAttributes = navBarText
        UIBarButtonItem.appearance().tintColor = UIColor.white

    }
    
}
