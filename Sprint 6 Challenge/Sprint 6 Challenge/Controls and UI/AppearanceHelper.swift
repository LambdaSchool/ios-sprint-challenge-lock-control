//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Lisa Sampson on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    static func setUpAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.purple
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UIBarButtonItem.appearance().tintColor = UIColor.white
    }
}
