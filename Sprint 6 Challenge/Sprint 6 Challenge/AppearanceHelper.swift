//
//  AppearanceHelper.swift
//  UIAppearanceAndAnimation
//
//  Created by Spencer Curtis on 8/21/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static var lambdaRed = UIColor(red: 210.0/255.0, green: 15.0/255.0, blue: 15.0/255.0, alpha: 1.0)
    static var buttonBlack = UIColor(red: 1.0/255.0, green: 1.0/255.0, blue: 1.0/255.0, alpha: 1.0)

    
    static func setRedAppearance() {
        
        UINavigationBar.appearance().barTintColor = lambdaRed
        UIBarButtonItem.appearance().tintColor = buttonBlack
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
//    static func style(button: UIButton) {
//
//        button.titleLabel?.adjustsFontForContentSizeCategory = true
//        button.setTitleColor(buttonBlack, for: .normal)
//        button.backgroundColor = lambdaRed
//        button.titleLabel?.text = ""
//        button.titleLabel?.textColor = buttonBlack
//    }
    
}


