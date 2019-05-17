//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Hector Steven on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum AppearanceHelper {
	
	static var backGroundColor = UIColor(red: 212.0/255.0, green: 87.0/225.0, blue: 80.0/255.0, alpha: 1.0)
	static var lockBackGrounColor = UIColor.gray
	static var sliderBackGroundColoer = UIColor.lightGray
	
	static func setTheme () {
		
		UINavigationBar.appearance().barTintColor = backGroundColor
		
	}
	
}

