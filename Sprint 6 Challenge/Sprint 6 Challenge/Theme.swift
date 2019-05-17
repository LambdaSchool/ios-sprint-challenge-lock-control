//
//  Theme.swift
//  Sprint 6 Challenge
//
//  Created by Victor  on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum Theme {
    static var red = UIColor.red
    static var white = UIColor.white
    
    static func setupViews() {
        UINavigationBar.appearance().tintColor = white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : white]
        UINavigationBar.appearance().barTintColor = red
    }
}
