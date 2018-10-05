//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Madison Waters on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    
    static var lightGray = UIColor(red:180.0/255.0, green:180.0/255.0, blue:180.0/255.0, alpha:1.0)
    static var mediumGray = UIColor(red:150.0/255.0, green:150.0/255.0, blue:150.0/255.0, alpha:1.0)
    static var darkGray = UIColor(red:65.0/255.0, green:65.0/255.0, blue:65.0/255.0, alpha:1.0)

    static func navBarAppearance() {
        
        UINavigationBar.appearance().barTintColor = darkGray
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().largeTitleTextAttributes = attributes
    }
}
