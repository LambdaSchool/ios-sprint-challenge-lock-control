//
//  Appearance.swift
//  Sprint 6 Challenge
//
//  Created by Jonathan T. Miles on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    static var red = UIColor.red
    static var white = UIColor.white
    
    static func setUpRedAndWhiteTheme() {
        UINavigationBar.appearance().barTintColor = red
        UIBarButtonItem.appearance().tintColor = white
    }
}
