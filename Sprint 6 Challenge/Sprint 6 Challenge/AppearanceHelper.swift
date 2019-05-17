//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Jeffrey Carpenter on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static let navBarBackgroundColor = #colorLiteral(red: 0.7568628192, green: 0.7764706612, blue: 0.5176470876, alpha: 1)
    static let navBarTextColor = #colorLiteral(red: 0.1490196139, green: 0.160784319, blue: 0.1725490242, alpha: 1)
    
    static func setupNavigationBarAppearance() {
        
        UINavigationBar.appearance().barTintColor = navBarBackgroundColor
        UIBarButtonItem.appearance().tintColor = navBarTextColor
    }
}
