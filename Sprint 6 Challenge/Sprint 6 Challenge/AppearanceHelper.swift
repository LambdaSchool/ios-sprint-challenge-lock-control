//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by William Bundy on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum AppearanceHelper
{
	static func applyTheme()
	{
		UINavigationBar.appearance().tintColor = UIColor.blue
		UINavigationBar.appearance().backgroundColor = UIColor.blue
		UINavigationBar.appearance().barTintColor = UIColor.blue
		let textAttribs = [NSAttributedStringKey.foregroundColor:UIColor.white]
		UINavigationBar.appearance().titleTextAttributes = textAttribs
		UIBarButtonItem.appearance().tintColor = UIColor.white
	}
}
