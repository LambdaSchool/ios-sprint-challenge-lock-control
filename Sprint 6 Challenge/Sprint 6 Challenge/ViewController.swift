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
	
	
	@IBAction func resetBarButton(_ sender: Any) {
	}
	
	@IBOutlet var sliderContainerView: UIView!
	@IBOutlet var mainView: UIView!

}

