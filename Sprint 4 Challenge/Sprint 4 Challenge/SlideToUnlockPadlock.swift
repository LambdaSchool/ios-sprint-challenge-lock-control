//
//  SlideToUnlockPadlock.swift
//  Sprint 4 Challenge
//
//  Created by Michael Redig on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SlideToUnlockPadlock: UIControl {

	private let lockImageView = UIImageView()
	private let slider: SlideToUnlock

	var unlockPrompt = "Slide to unlock"
	var willUnlockPrompt = "Release to unlock"
	var didUnlockPrompt = "Unlocked"

	override var tintColor: UIColor! {
		didSet {
			slider.tintColor = tintColor
		}
	}

	override var backgroundColor: UIColor? {
		didSet {
			guard let bgColor = backgroundColor else { return }
			var hue: CGFloat = 0
			var sat: CGFloat = 0
			var bright: CGFloat = 0
			var alpha: CGFloat = 0
			bgColor.getHue(&hue, saturation: &sat, brightness: &bright, alpha: &alpha)
			bright = max(0, bright - 0.3)
			slider.backgroundColor = UIColor(hue: hue, saturation: sat, brightness: bright, alpha: alpha)
		}
	}

	var completionThreshold: CGFloat {
		get {
			return slider.completionThreshold
		}
		set {
			slider.completionThreshold = newValue
		}
	}

	var value: CGFloat {
		get {
			return slider.value
		}
		set {
			slider.value = newValue
		}
	}

	var locked = true {
		didSet {
			setLockImage()
			slider.textLabel.text = locked ? unlockPrompt : didUnlockPrompt
			isEnabled = locked
		}
	}

	required init?(coder aDecoder: NSCoder) {
		slider = SlideToUnlock(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
		setLockImage()
		if lockImageView.superview == nil {
			addSubview(lockImageView)
			lockImageView.contentMode = .scaleAspectFit
			lockImageView.isUserInteractionEnabled = false
			lockImageView.translatesAutoresizingMaskIntoConstraints = false
			lockImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
			lockImageView.heightAnchor.constraint(equalTo: lockImageView.widthAnchor).isActive = true
			lockImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			lockImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		}

		if slider.superview == nil {
			addSubview(slider)
			slider.translatesAutoresizingMaskIntoConstraints = false
			slider.topAnchor.constraint(equalTo: lockImageView.bottomAnchor, constant: 16).isActive = true
			slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
			slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
			slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
		}

		slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
		slider.addTarget(self, action: #selector(touchDown), for: .touchDown)
		slider.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
		slider.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
		slider.addTarget(self, action: #selector(touchDragInside), for: .touchDragInside)
		slider.addTarget(self, action: #selector(touchDragOutside), for: .touchDragOutside)
		slider.addTarget(self, action: #selector(touchCancel), for: .touchCancel)
		slider.addTarget(self, action: #selector(primaryActionTriggered), for: .primaryActionTriggered)
		backgroundColor = .lightGray
		layer.cornerRadius = min(20, bounds.size.height / 2)
	}

	private func setLockImage() {
		if locked {
			lockImageView.image = #imageLiteral(resourceName: "Locked")
		} else {
			lockImageView.image = #imageLiteral(resourceName: "Unlocked")
		}
	}

	// MARK: - Controls
	@objc func valueChanged(_ sender: SlideToUnlock) {
		if sender.value > completionThreshold {
			sender.textLabel.text = willUnlockPrompt
		} else {
			sender.textLabel.text = unlockPrompt
		}
		sendActions(for: .valueChanged)
	}

	@objc func touchDown(_ sender: SlideToUnlock) {
		sendActions(for: .touchDown)
	}

	@objc func touchUpOutside(_ sender: SlideToUnlock) {
		sendActions(for: .touchUpOutside)
	}

	@objc func touchUpInside(_ sender: SlideToUnlock) {
		sendActions(for: .touchUpInside)
	}

	@objc func touchDragInside(_ sender: SlideToUnlock) {
		sendActions(for: .touchDragInside)
	}

	@objc func touchDragOutside(_ sender: SlideToUnlock) {
		sendActions(for: .touchDragOutside)
	}

	@objc func touchCancel(_ sender: SlideToUnlock) {
		sendActions(for: .touchCancel)
	}

	@objc func primaryActionTriggered(_ sender: SlideToUnlock) {
		locked = false
		sender.textLabel.text = didUnlockPrompt
		sendActions(for: .primaryActionTriggered)
	}
}
