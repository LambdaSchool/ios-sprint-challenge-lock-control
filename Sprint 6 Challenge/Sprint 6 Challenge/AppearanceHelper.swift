//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Carolyn Lea on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance
{
    static func setUpTheme()
    {
        UINavigationBar.appearance().barTintColor = UIColor.green
        let navigationFont = applicationFont(with: .title1, pointSize: 25)
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: navigationFont]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UIBarButtonItem.appearance().tintColor = UIColor.black
    }
    
    static func applicationFont(with textStyle: UIFontTextStyle, pointSize: CGFloat) -> UIFont
    {
        let result = UIFont(name: "BodoniSvtyTwoITCTT-Book", size: pointSize)!
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: result)
    }
}
