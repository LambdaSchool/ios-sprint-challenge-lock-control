//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Madison Waters on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct AppearanceHelper {
    
    static  let lambdaRed = UIColor(red: 212.0/255.0, green: 87.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    
    static func setAppearance() {
        
        UINavigationBar.appearance().barTintColor = lambdaRed
        UIBarButtonItem.appearance().tintColor = .white
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
    }
}
