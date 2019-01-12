//
//  Theme.swift
//  Sprint 6 Challenge
//
//  Created by Lotanna Igwe-Odunze on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum Theme {
    
    //#476A6F
    static let mikadoYellow = UIColor(red: 249/255, green: 188/255, blue: 19/255, alpha: 1.0)
    
    // #88498F
    static let plum = UIColor(red: 136/255, green: 73/255, blue: 143/255, alpha: 1.0)
    
    // #95639B
    
    static let pompAndPowder = UIColor(red: 149/255, green: 99/255, blue: 155/255, alpha: 1.0)
    
    static func generalAppearance() {
        UINavigationBar.appearance().barTintColor = pompAndPowder
        
        let navBarText = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = navBarText
    }
    
}
