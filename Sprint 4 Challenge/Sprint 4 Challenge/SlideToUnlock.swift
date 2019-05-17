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

	private let knob = UIView()
//	private let bgView = UIView()
	private var minValue: CGFloat = 0
	private var maxValue: CGFloat = 0
	var value: CGFloat = 0

	// MARK: - Initializer stuff
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
//		bgView.frame = bounds
		backgroundColor = .gray
//		insertSubview(bgView, aboveSubview: self)
		let radius = bounds.size.height * 0.4
		padding = bounds.size.height * 0.1

		minValue = padding + radius
		maxValue = bounds.maxX - (padding + radius)

		knob.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
		knob.center = CGPoint(x: minValue, y: bounds.midY)
		knob.backgroundColor = .darkGray
		knob.isUserInteractionEnabled = false
		insertSubview(knob, aboveSubview: self)

		layer.cornerRadius = bounds.size.height / 2
		knob.layer.cornerRadius = knob.bounds.size.height / 2
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		setup()
	}

	// MARK: - Touch Handlers
	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		let location = touch.location(in: self)
		if knob.frame.contains(location) {
			knob.layer.removeAllAnimations()
			updateValue(at: touch)
			sendActions(for: [.touchDown])
			return true
		} else {
			return false
		}
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
			updateValue(at: touch)
			resetSlider()

			let location = touch.location(in: self)
			if bounds.contains(location) {
				sendActions(for: [.touchUpInside])
			} else {
				sendActions(for: [.touchUpOutside])
			}
		}
	}

	override func cancelTracking(with event: UIEvent?) {
		resetSlider()
		sendActions(for: [.touchCancel])
	}

	private func updateValue(at touch: UITouch) {
		let location = touch.location(in: self)
		knob.center.x = location.x
		checkSliderBounds()

		let distance = maxValue - minValue
		value = (knob.center.x - minValue) / distance
		sendActions(for: .valueChanged)
	}

	private func resetSlider() {
		UIView.animate(withDuration: 0.2) { [weak self] in
			guard let self = self else { return }
			self.knob.center.x = self.minValue
		}
	}

	private func checkSliderBounds() {
		if knob.center.x < minValue {
			knob.center.x = minValue
		}
		if knob.center.x > maxValue {
			knob.center.x = maxValue
		}
	}
}
