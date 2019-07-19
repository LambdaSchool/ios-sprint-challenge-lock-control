//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Nathan Hedgeman on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum AppearanceHelper {
    
    static let offWhite = UIColor(red: 242 / 255, green: 241 / 255, blue: 235 / 255, alpha: 1.0)
    
    static let myRed = UIColor(red: 255 / 255, green: 33 / 255, blue: 33 / 255, alpha: 1.0)
    
    static func setCustomTheme() {
        
        UINavigationBar.appearance().barTintColor = offWhite
        UINavigationBar.appearance().tintColor = myRed
        
    }
}
