//
//  Appearence.swift
//  Sprint 6 Challenge
//
//  Created by Farhan on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum Appearence{
    
    static var skyBlue = UIColor(red: 80.0/255.0, green: 186/255.0, blue: 248.0/255.0, alpha: 1.0)
    
    static func setTheme(){
        
        // NavBar
        UINavigationBar.appearance().barTintColor = skyBlue
        UINavigationBar.appearance().tintColor = .white

        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Jenna Sue", size: 35.0)]
        
    }
    
    
}
