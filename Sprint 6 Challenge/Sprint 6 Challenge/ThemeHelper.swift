//
//  ThemeHelper.swift
//  Sprint 6 Challenge
//
//  Created by Michael Flowers on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {
    
    //set the theme for the navigationBarItems
    
    static var badgerRed = UIColor(red: 255, green: 27, blue: 0, alpha: 1)
    static var badgerWhite = UIColor(red: 247, green: 255, blue: 245, alpha: 1)
    
    static func setTheme(){
    
        UIBarButtonItem.appearance().tintColor = badgerRed
    }
}
