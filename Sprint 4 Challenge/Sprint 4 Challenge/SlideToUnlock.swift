//
//  SlideToUnlock.swift
//  Sprint 4 Challenge
//
//  Created by Michael Redig on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SlideToUnlock: UIControl {

	private var padding: CGFloat = 0

	private let slider = UIView()
	private let bgView = UIView()
	private var minValue: CGFloat = 0
	private var maxValue: CGFloat = 0
	var value: CGFloat = 0

	// MARK: - Initializer stuff
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
		bgView.frame = bounds
		bgView.backgroundColor = .gray
		insertSubview(bgView, aboveSubview: self)
		let radius = bounds.size.height * 0.4
		padding = bounds.size.height * 0.1

		minValue = padding + radius
		maxValue = bounds.maxX - (padding + radius)

		slider.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
		slider.center = CGPoint(x: minValue, y: bounds.midY)
		slider.backgroundColor = .darkGray
		insertSubview(slider, aboveSubview: bgView)

		bgView.layer.cornerRadius = bgView.bounds.size.height / 2
		slider.layer.cornerRadius = slider.bounds.size.height / 2
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		setup()
	}

	// MARK: - Touch Handlers
	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		updateValue(at: touch)
		sendActions(for: [.touchDown])
		return true
	}

	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		let location = touch.location(in: self)
		if bounds.contains(location) {
			updateValue(at: touch)
			sendActions(for: [.touchDragInside])
		} else {
			updateValue(at: touch)
			sendActions(for: [.touchDragOutside])
		}
		return true
	}

	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		if let touch = touch {
			let location = touch.location(in: self)
			if bounds.contains(location) {
				updateValue(at: touch)
				sendActions(for: [.touchUpInside])
			} else {
				sendActions(for: [.touchUpOutside])
			}
		}
	}

	override func cancelTracking(with event: UIEvent?) {
		sendActions(for: [.touchCancel])
	}

	private func updateValue(at touch: UITouch) {

	}

	private func checkSliderBounds() {
		if slider.center.x < minValue {
			slider.center.x = minValue
		}
		if slider.center.x > maxValue {
			slider.center.x = maxValue
		}
	}
}
