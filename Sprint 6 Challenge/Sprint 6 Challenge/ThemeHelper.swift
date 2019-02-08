//
//  ThemeHelper.swift
//  Sprint 6 Challenge
//
//  Created by Diante Lewis-Jolley on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {

     var customPurple = UIColor(displayP3Red: 0.24, green: 0.05, blue: 0.63, alpha: 1)
     var backgroundGrey = UIColor(displayP3Red: 0.45, green: 0.45, blue: 0.45, alpha: 1)

    func setTheme() {
        UINavigationBar.appearance().tintColor = customPurple

        let textAtrributed: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAtrributed







    }







}
