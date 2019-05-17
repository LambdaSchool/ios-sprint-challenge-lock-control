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
	private var minValue: CGFloat = 0
	private var maxValue: CGFloat = 0
	var value: CGFloat = 0
	var textLabel = UILabel()
	var completionValue: CGFloat = 0.8

	// MARK: - Initializer stuff
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		textLabel.text = "Slide to unlock"
		setup()
	}

	private func setup() {
		backgroundColor = .gray
		let radius = bounds.size.height * 0.4
		padding = bounds.size.height * 0.1

		if textLabel.superview == nil {
			insertSubview(textLabel, aboveSubview: self)
			textLabel.translatesAutoresizingMaskIntoConstraints = false
			textLabel.textAlignment = .center
			textLabel.textColor = .white
			textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
			textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
			textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
			textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
			textLabel.adjustsFontSizeToFitWidth = true
			textLabel.minimumScaleFactor = 0.25
			textLabel.layer.shadowColor = UIColor.black.cgColor
			textLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
			textLabel.layer.shadowRadius = 5
			textLabel.layer.shadowOpacity = 0.5
		}

		minValue = padding + radius
		maxValue = bounds.maxX - (padding + radius)

		knob.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
		knob.center = CGPoint(x: minValue, y: bounds.midY)
		knob.backgroundColor = .darkGray
		knob.isUserInteractionEnabled = false
		insertSubview(knob, aboveSubview: textLabel)

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
			if value >= completionValue {
				sendActions(for: .primaryActionTriggered)
			}
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
		let oldValue = value
		value = (knob.center.x - minValue) / distance
		if oldValue != value {
			sendActions(for: .valueChanged)
		}
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
