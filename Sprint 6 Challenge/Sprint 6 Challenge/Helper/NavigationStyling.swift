//
//  NavigationStyling.swift
//  Sprint 6 Challenge
//
//  Created by Ivan Caldwell on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct NavigationStyling {
    static var barColor = UIColor(red:139.0/255.0, green:13.0/225.0, blue:38.0/255.0, alpha: 1.0)
    static func setAppearance(){
        UINavigationBar.appearance().backgroundColor = barColor
        UINavigationBar.appearance().barTintColor = barColor
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        let barButtonAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .normal)
    }
}
