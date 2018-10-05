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
        UINavigationBar.appearance().barTintColor = .red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UIImageView.appearance().backgroundColor = .lightGray
        UIView.appearance().layer.cornerRadius = 40
    }
    
}
