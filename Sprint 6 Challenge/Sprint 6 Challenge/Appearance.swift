//
//  Appearance.swift
//  Sprint 6 Challenge
//
//  Created by Dillon McElhinney on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    static func setupAppearance() {
        UINavigationBar.appearance().tintColor = .accentColor
        UINavigationBar.appearance().barTintColor = .darkerColor
        UINavigationBar.appearance().largeTitleTextAttributes = [ .foregroundColor: UIColor.accentColor]
        UINavigationBar.appearance().isTranslucent = false
    }
}

extension UIColor {
    static let darkerColor = UIColor(red: 0.125, green: 0.125, blue: 0.16, alpha: 1.0)
    static let darkColor = UIColor(red: 0.15, green: 0.15, blue: 0.185, alpha: 1.0)
    static let accentColor = UIColor(red: 182/255, green: 60/255, blue: 58/255, alpha: 1)
}
