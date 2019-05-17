//
//  ThemeHelper.swift
//  Sprint 6 Challenge
//
//  Created by Michael Flowers on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    //set the theme for the navigationBarItems
    
    static var black = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    static var white = UIColor(red: 255/255, green:255/255, blue: 255/255, alpha: 1)
    
    
    static func setTheme(){
        
        UIBarButtonItem.appearance().tintColor = white
        
        
        let textAttributes: [NSAttributedString.Key : Any] = [.foregroundColor: white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().barTintColor = black
        
    }
}
