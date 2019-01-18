//
//  Helpers.swift
//  Sprint 6 Challenge
//
//  Created by Jason Modisett on 10/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

// Subclass for using the correct status bar style
class NavController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
