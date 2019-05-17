//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello!"
		
		sliderContainerView.layer.cornerRadius = 28
		mainView.layer.cornerRadius = 22
		
    }
	
	@IBAction func unlockedWithSlider(_ sender: UIControl) {
		print("unlock")
		lockImageView.image = UIImage(named: "Unlocked")
	}
	
	@IBAction func resetBarButton(_ sender: Any) {
	}
	
	
	@IBOutlet var lockImageView: UIImageView!
	@IBOutlet var sliderContainerView: UIView!
	@IBOutlet var mainView: UIView!

}

