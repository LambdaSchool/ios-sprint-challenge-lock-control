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
    static var maroonRed = UIColor(red: 175.0/255.0, green: 5.0/255.0, blue: 5.0/255.0, alpha: 1.0)
    static var darkRed = #colorLiteral(red: 0.5432647839, green: 0.02619154518, blue: 0.04654160588, alpha: 1)
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = darkRed
        //Styling the Navigation Title text
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes

    }
    
    
    
    
}
