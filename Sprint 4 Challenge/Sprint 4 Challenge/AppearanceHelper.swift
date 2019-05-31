//
//  AppearanceHelper.swift
//  Sprint 4
//
//  Created by Jordan Davis on 5/31/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static func setCustomAppearance() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.marvelRed]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        UINavigationBar.appearance().barTintColor = UIColor.marvelRed
        
        UIBarButtonItem.appearance().tintColor = .white
    }
    
    
    //for some reason, something in my code is preventing my UINav Bar form changing its appearance. 
}
