//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Julian A. Fordyce on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static var someBlue = UIColor(red:37.0/255.0, green:74.0/255.0, blue: 108.0/255.0, alpha: 1.0)
   
    static func setAppearance() {
        UINavigationBar.appearance().backgroundColor = someBlue
        UIBarButtonItem.appearance().tintColor = someBlue
    }
}

