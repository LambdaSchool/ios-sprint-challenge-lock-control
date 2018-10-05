//
//  Appearance.swift
//  Sprint 6 Challenge
//
//  Created by Scott Bennett on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    
    static func setAppearance() {
        
        UINavigationBar.appearance().barTintColor = UIColor.darkGray
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().largeTitleTextAttributes = attributes
        
        UIBarButtonItem.appearance().tintColor = .white
        
        
    }
}
