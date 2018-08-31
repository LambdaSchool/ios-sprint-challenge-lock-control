//
//  Appearance.swift
//  Sprint 6 Challenge
//
//  Created by Simon Elhoej Steinmejer on 31/08/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

extension UIColor
{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor
    {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}

extension UINavigationController
{
    open override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
}

enum Appearance
{
    static func setupAppearance()
    {
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 36, green: 36, blue: 36)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Montserrat-SemiBold", size: 20)!]
    }
}
