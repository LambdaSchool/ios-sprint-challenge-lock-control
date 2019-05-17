//
//  AppearanceHelper.swift
//  Sprint 4 Challenge
//
//  Created by Michael Redig on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
	static let backgroundLockedColor = UIColor(red: 0.3, green: 0.1, blue: 0.2, alpha: 1.0)
	static let accentLockedColor = UIColor(red: 0.8, green: 0.3, blue: 0.4, alpha: 1.0)

	static let backgroundUnlockedColor = UIColor(red: 0.1, green: 0.3, blue: 0.2, alpha: 1.0)
	static let accentUnlockedColor = UIColor(red: 0.3, green: 0.8, blue: 0.4, alpha: 1.0)

	static func setLockedAppearance() {
		UINavigationBar.appearance().barTintColor = backgroundLockedColor
		UINavigationBar.appearance().backgroundColor = backgroundLockedColor
		UIBarButtonItem.appearance().tintColor = accentLockedColor

		let textAttributes = [NSAttributedString.Key.foregroundColor: accentLockedColor]
		UINavigationBar.appearance().titleTextAttributes = textAttributes
		UINavigationBar.appearance().largeTitleTextAttributes = textAttributes

	}

}
