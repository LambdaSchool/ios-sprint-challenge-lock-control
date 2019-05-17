//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Hector Steven on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Foundation

enum AppearanceHelper {
	
	static var backGroundColor = UIColor(red: 160/255.0, green: 160/225.0, blue: 128/255.0, alpha: 0.5)
	static var lockBackGrounColor = UIColor(red: 160/255.0, green: 160/225.0, blue: 128/255.0, alpha: 1)
	static var sliderBackGroundColoer = UIColor(red: 160/255.0, green: 190/225.0, blue: 128/255.0, alpha: 0.5)
	
	static func fbsbltcFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont{
		let font = UIFont(name: "Fatboy Slim BLTC BRK", size: pointSize)!
		return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
	}
	
	static func setTheme () {
		
		UINavigationBar.appearance().barTintColor = backGroundColor
//		UIBarButtonItem.appearance().tintColor = .red
		
		let font = fbsbltcFont(with: .caption1, pointSize: 18)
		let textAttributes = [NSAttributedString.Key.font: font]
		UINavigationBar.appearance().titleTextAttributes = textAttributes
		UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
	}
	
}

