//
//  SliderControl.swift
//  Sprint 6 Challenge
//
//  Created by Hector Steven on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SliderControl: UIControl {
	let maxOrigin = 327
	let minOrigin = 32
	var frameOrigin: CGRect?
	
	override func layoutSubviews() {
		
		
		frameOrigin = frame
		print(frame.midX)
		backgroundColor = .red
		clipsToBounds = true
		layer.cornerRadius = frame.size.width / 2
	}

	// 32 is min x
	//327 is max X
	
	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		
		return true
	}
	
	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		let touch = touch.location(in: self)
		
		if bounds.contains(touch) && frame.midX < 280 {
//			center.x += 1
			let midX = frame.midX
			
			if midX > 60 {
				center.x += 3
			} else if midX > 100 {
				center.x += 6
			} else {
				center.x += 1
			}
			
		}
		
		return true
	}
	
	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		//let touch = touch!.location(in: self)
		
		if frame.midX < 270 {
			print(frame.midX)
			UIView.animate(withDuration: 0.2) {
				self.frame = self.frameOrigin!
			}
		} else {
			UIView.animate(withDuration: 0.2, animations: {
				self.center.x = CGFloat(self.maxOrigin)
			}) { _ in
				self.sendActions(for: [.valueChanged])
			}
			
		}
		
		print(frame.midX)
		
	}
	
	override func cancelTracking(with event: UIEvent?) {
		
	}
}
