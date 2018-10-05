//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Ilgar Ilyasov on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static func setTheme() {
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UIImageView.appearance().backgroundColor = .lightGray
    }
    
}
