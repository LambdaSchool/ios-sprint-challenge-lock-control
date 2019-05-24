//
//  ApperanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Hayden Hastings on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum ApperanceHelper {
    
    static let lightBlue = UIColor(red: 127 / 255, green: 203 / 255, blue: 187 / 255, alpha: 1.0)
    
    static let yellowColor = UIColor(red: 235 / 255, green: 226 / 255, blue: 76 / 255, alpha: 1.0)
    
    static func setLightBlueAppearance() {
        UINavigationBar.appearance().barTintColor = lightBlue
        UINavigationBar.appearance().tintColor = yellowColor
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: yellowColor]
        
    }
}
