//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Lisa Sampson on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .purple
        let textAttr = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttr
        UIBarButtonItem.appearance().tintColor = .white
    }
}
