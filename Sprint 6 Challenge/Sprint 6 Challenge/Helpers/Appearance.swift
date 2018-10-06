//
//  Appearance.swift
//  Sprint 6 Challenge
//
//  Created by Jason Modisett on 10/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearance {
    
    static var lambdaRed = UIColor(red: 212.0/255.0, green: 87.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    
    static func setup() {
        UINavigationBar.appearance().barTintColor = lambdaRed
        
        let attr = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = attr
        UINavigationBar.appearance().largeTitleTextAttributes = attr
    }
    
}
