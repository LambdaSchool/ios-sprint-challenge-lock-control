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
		
		originCenter = sliderControlOuutLet.center.x
		print(originCenter)
		
		sliderContainerView.layer.cornerRadius = 28
		mainView.layer.cornerRadius = 22
		
		resetButtonOutlet.isEnabled = false
		resetButtonOutlet.tintColor = .white
    }
	
	@IBAction func unlockedWithSlider(_ sender: UIControl) {
		print("unlock")
		lockImageView.image = UIImage(named: "Unlocked")
		resetButtonOutlet.isEnabled = true
		
		UIView.animate(withDuration: 0.1) {
			self.resetButtonOutlet.tintColor = .black
			
		}
	}
	
	@IBAction func resetBarButton(_ sender: Any) {
		
		UIView.animate(withDuration: 0.1, animations: {
			self.sliderControlOuutLet.center.x = self.originCenter
			
		}) { _ in
			DispatchQueue.main.async {
				self.lockImageView.image = UIImage(named: "Locked")
				
			}
			
		}
	}
	
	
	@IBOutlet var sliderControlOuutLet: SliderControl!
	@IBOutlet var resetButtonOutlet: UIBarButtonItem!
	@IBOutlet var lockImageView: UIImageView!
	@IBOutlet var sliderContainerView: UIView!
	@IBOutlet var mainView: UIView!
	var originCenter: CGFloat = 0
}

