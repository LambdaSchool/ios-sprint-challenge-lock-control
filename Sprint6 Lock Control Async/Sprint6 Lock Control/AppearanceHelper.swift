//
//  AppearanceHelper.swift
//  Sprint6 Lock Control
//
//  Created by Sergey Osipyan on 1/18/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static var lambdaRed = UIColor(red: 210.0/255.0, green: 15.0/255.0, blue: 15.0/255.0, alpha: 1.0)
    static var buttonBlack = UIColor(red: 1.0/255.0, green: 1.0/255.0, blue: 1.0/255.0, alpha: 1.0)
    
    static func setRedAppearance() {
        
        UINavigationBar.appearance().barTintColor = lambdaRed
        UIBarButtonItem.appearance().tintColor = buttonBlack
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
