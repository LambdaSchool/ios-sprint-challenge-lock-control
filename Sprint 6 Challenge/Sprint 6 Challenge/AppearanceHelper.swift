//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Samantha Gatt on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    
    static var navBarColor = UIColor(red: 202/255, green: 231/255, blue: 219/255, alpha: 1.0)
    static var navTextColor = UIColor.darkGray
    
    static func setup() {
        UINavigationBar.appearance().barTintColor = Appearance.navBarColor
        
        let navBarTitleText = [NSAttributedStringKey.foregroundColor : Appearance.navTextColor]
        UINavigationBar.appearance().titleTextAttributes = navBarTitleText
        UINavigationBar.appearance().largeTitleTextAttributes = navBarTitleText
        
        UIBarButtonItem.appearance()
        UIBarButtonItem.appearance().tintColor = Appearance.navTextColor
        let barButtonAttributes = [NSAttributedStringKey.foregroundColor : Appearance.navTextColor]
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .normal)
    }
}
