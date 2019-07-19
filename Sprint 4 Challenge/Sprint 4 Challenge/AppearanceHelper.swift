//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Kat Milton on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum AppearanceHelper {
    
    static var almostBlack = UIColor(red: 2.0/255.0, green: 1.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static var grayish = UIColor(red: 244.0/255.0, green: 239.0/255.0, blue: 235.0/255.0, alpha: 1.0)
    static var blueColor = UIColor(red: 0.0/255.0, green: 139.0/255.0, blue: 166.0/255.0, alpha: 1.0)
    
    static func setTheme() {
        UIButton.appearance().tintColor = blueColor
        UINavigationBar.appearance().barTintColor = almostBlack
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: blueColor]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        UILabel.appearance().textColor = blueColor
        
    }
    
    
}
