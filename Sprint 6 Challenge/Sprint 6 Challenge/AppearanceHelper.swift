//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Jeremy Taylor on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    static func setupAppearance() {
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().backgroundColor = UIColor(red: 26/255.0, green: 26/255.0, blue: 26/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = .white
        UIImageView.appearance().backgroundColor = .lightGray
    }
}
