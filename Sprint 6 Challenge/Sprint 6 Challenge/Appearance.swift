//
//  Appearance.swift
//  Sprint 6 Challenge
//
//  Created by David Doswell on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Appearance {
    static var customColor = UIColor(red: 210.0/255.0, green: 66.0/255.0, blue: 210.0/255.0, alpha: 1.0)

    static func setUp() {
        UINavigationBar.appearance().barTintColor = customColor
        UIBarButtonItem.appearance().tintColor = customColor

        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
    }
}
