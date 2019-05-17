//
//  SliderControl.swift
//  Sprint 6 Challenge
//
//  Created by Hector Steven on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SliderControl: UIControl {
	var frameOrigin: CGRect?
	
	override func layoutSubviews() {
		frameOrigin = frame
		backgroundColor = .red
		clipsToBounds = true
		layer.cornerRadius = frame.size.width / 2
	}

	// 08 is min x
	//308 is max X
	
	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		
		return true
	}
	
	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		let touch = touch.location(in: self)
		
		if bounds.contains(touch) && frame.midX < 280 {
			center.x += 1
		}
		
		return true
	}
	
	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		let touch = touch!.location(in: self)
		
		UIView.animate(withDuration: 0.2) {
			self.frame = self.frameOrigin!
		}
		
		
		
//		print(touch)
		print(frame)
	}
	
	override func cancelTracking(with event: UIEvent?) {
		
	}
}
