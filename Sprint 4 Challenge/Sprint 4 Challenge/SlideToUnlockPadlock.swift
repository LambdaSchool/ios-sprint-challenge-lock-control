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

	var locked = true {
		didSet {
			setLockImage()
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
}
