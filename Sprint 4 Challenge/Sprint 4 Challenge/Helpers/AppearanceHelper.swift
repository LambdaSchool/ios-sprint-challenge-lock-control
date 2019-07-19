//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Sean Acres on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum AppearanceHelper {
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = .red
    }
    

    
}
