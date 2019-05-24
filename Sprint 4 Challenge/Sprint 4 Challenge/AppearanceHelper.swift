//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Jeremy Taylor on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    static func setupAppearance() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().barTintColor = UIColor(red: 135 / 255, green: 30 / 255, blue: 38 / 255, alpha: 1.0)
        UINavigationBar.appearance().tintColor = .black
    }
}
