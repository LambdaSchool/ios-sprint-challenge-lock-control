//
//  AppearanceHelper.swift
//  Lock(Sprint 4)
//
//  Created by Jordan Davis on 5/30/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static func setCustomAppearance() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.smokeGray]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        UINavigationBar.appearance().barTintColor = UIColor.marvelRed
        
        UIBarButtonItem.appearance().tintColor = .white
    }
    
    
}
