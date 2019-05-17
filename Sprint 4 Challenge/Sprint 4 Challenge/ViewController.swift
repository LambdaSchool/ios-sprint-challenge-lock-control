//
//  ViewController.swift
//  Sprint 4 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var resetButton: UIBarButtonItem!
	@IBOutlet var slideToUnlockPad: SlideToUnlockPadlock!

	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		slideToUnlockPad.tintColor = AppearanceHelper.accentLockedColor
		slideToUnlockPad.backgroundColor = AppearanceHelper.backgroundLockedColor

		let button = UIButton()
		button.setTitle("Reset", for: .normal)
		button.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
		button.tintColor = AppearanceHelper.accentLockedColor
		resetButton.customView = button
		resetButton.customView?.alpha = 0
		resetButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func sliderUnlocked(_ sender: SlideToUnlockPadlock) {
		resetButton.isEnabled = true
		animateResetButtonVisible()
		sender.isEnabled = false

		slideToUnlockPad.tintColor = AppearanceHelper.accentUnlockedColor
		slideToUnlockPad.backgroundColor = AppearanceHelper.backgroundUnlockedColor
		navigationController?.navigationBar.barTintColor = AppearanceHelper.backgroundUnlockedColor
	}

	func animateResetButtonVisible() {
		UIView.animate(withDuration: 0.5) {
			self.resetButton.customView?.alpha = 1
		}
	}

	func animateResetButtonHidden() {
		UIView.animate(withDuration: 0.5) {
			self.resetButton.customView?.alpha = 0
		}
	}

	@IBAction func resetButtonPressed(_ sender: UIButton) {
		animateResetButtonHidden()
		resetButton.isEnabled = false
		slideToUnlockPad.locked = true
		slideToUnlockPad.tintColor = AppearanceHelper.accentLockedColor
		slideToUnlockPad.backgroundColor = AppearanceHelper.backgroundLockedColor
		navigationController?.navigationBar.barTintColor = AppearanceHelper.backgroundLockedColor
	}
}
