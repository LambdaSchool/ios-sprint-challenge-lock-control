//
//  SliderControl.swift
//  Sprint 6 Challenge
//
//  Created by Hector Steven on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SliderControl: UIControl {
	let unLockState = CGFloat(260)
	let maxOrigin = 327 // 32 is min x
	let minOrigin = 32 //327 is max X
	var frameOrigin: CGRect?
	
	override func layoutSubviews() {
		frameOrigin = frame
		print(frame.midX)
		backgroundColor = .red
		clipsToBounds = true
		layer.cornerRadius = frame.size.width / 2
	}

	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		return true
	}
	
	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		let touch = touch.location(in: self)
		
		if bounds.contains(touch) && frame.midX < 280 {
			let midX = frame.midX
			
			if midX > 45 {
				center.x += 2
			} else if midX > 60 {
				center.x += 3
			} else if midX > 100 {
				center.x += 6
			} else {
				center.x += 1
			}
			
		} else if frame.midX > unLockState {
			UIView.animate(withDuration: 0.1, animations: {
				self.center.x = CGFloat(self.maxOrigin)
			})
		}
		
		
		return true
	}
	
	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		defer {
			super.endTracking(touch, with: event)
		}
		
		
		if frame.midX < unLockState {
			
			UIView.animate(withDuration: 0.1) {
				self.frame = self.frameOrigin!
			}
			
		} else {
			
			UIView.animate(withDuration: 0.1, animations: {
				self.center.x = CGFloat(self.maxOrigin)
			}) { _ in
				self.sendActions(for: [.valueChanged])
			}
			
		}
		
//		print(frame.midX)
	}
	
	override func cancelTracking(with event: UIEvent?) {
		sendActions(for: [.touchCancel])
	}
}
