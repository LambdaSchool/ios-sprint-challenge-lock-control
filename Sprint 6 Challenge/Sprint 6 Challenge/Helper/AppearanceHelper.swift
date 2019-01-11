//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Ivan Caldwell on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct AppearanceHelper {
    static var maroonRed = UIColor(red: 143.0/255.0, green: 9.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    
    static func setAppearance() {
        // Styling the Navigation Color: Fail...
        UINavigationBar.appearance().tintColor = maroonRed
        // Styling the Navigation Title text
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
        // Styling the bar item text.
        let barTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.green]
        UIBarButtonItem.appearance().setTitleTextAttributes(barTextAttributes, for: .normal)
    }
    
    static func changeBarItemColor () {
        let barTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(barTextAttributes, for: .normal)
    }
}
