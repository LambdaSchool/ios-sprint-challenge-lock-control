//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Julian A. Fordyce on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static func setCustomAppearance() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.smokeGray]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        UINavigationBar.appearance().barTintColor = UIColor.darkishPurple
        
        UIBarButtonItem.appearance().tintColor = .white
    }
}
