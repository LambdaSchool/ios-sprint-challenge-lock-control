//
//  File.swift
//  Sprint 4 Challenge
//
//  Created by Diante Lewis-Jolley on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit



enum ThemeHelper {

   static var customPurple = UIColor(displayP3Red: 0.24, green: 0.05, blue: 0.63, alpha: 1)
    static var backgroundGrey = UIColor(displayP3Red: 0.45, green: 0.45, blue: 0.45, alpha: 1)


    static func setTheme() {
        UINavigationBar.appearance().barTintColor = ThemeHelper.customPurple
        UIView.appearance().backgroundColor = ThemeHelper.backgroundGrey
        UIBarButtonItem.appearance().tintColor = ThemeHelper.customPurple




        let textAtrributed: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAtrributed
        UINavigationBar.appearance().largeTitleTextAttributes = textAtrributed


    }
}
