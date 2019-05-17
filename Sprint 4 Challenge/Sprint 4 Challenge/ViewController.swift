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
		slideToUnlockPad.tintColor = .green
		slideToUnlockPad.backgroundColor = .blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func sliderSlid(_ sender: SlideToUnlockPadlock) {
		print(sender.value)
	}

	@IBAction func sliderUnlocked(_ sender: SlideToUnlockPadlock) {
		sender.isEnabled = false
	}

	@IBAction func resetButtonPressed(_ sender: UIBarButtonItem) {
		slideToUnlockPad.locked = true
	}
}
