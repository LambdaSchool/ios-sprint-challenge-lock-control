//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by De MicheliStefano on 31.08.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static var darkBlue = UIColor(red:0.13, green:0.18, blue:0.34, alpha:1.0)
    static var turqoise = UIColor(red:0.11, green:0.79, blue:1.00, alpha:1.0)
    
    static func setupViews() {
        UINavigationBar.appearance().tintColor = turqoise
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        UINavigationBar.appearance().barTintColor = darkBlue
    }
    
}
