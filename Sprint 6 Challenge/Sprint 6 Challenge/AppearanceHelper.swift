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
	
	static var backGroundColor = UIColor(red: 212.0/255.0, green: 87.0/225.0, blue: 80.0/255.0, alpha: 1.0)
	static var lockBackGrounColor = UIColor.gray
	static var sliderBackGroundColoer = UIColor.lightGray
	
	static func fbsbltcFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont{
		let font = UIFont(name: "Fatboy Slim BLTC BRK", size: pointSize)!
		return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
	}
	
	static func setTheme () {
		
		UINavigationBar.appearance().barTintColor = backGroundColor
		
		let font = fbsbltcFont(with: .caption1, pointSize: 18)
		let textAttributes = [NSAttributedString.Key.font: font]
		UINavigationBar.appearance().titleTextAttributes = textAttributes
	}
	
}

