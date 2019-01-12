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
        design()

    }

// this will round the corners on the views
    func design() {
        sliderView.layer.cornerRadius = 20
        bigView.layer.cornerRadius = 20
        sliderBall.layer.cornerRadius = 25
    }
  


    @IBAction func resetButtonTapped(_ sender: Any) {
        // reset to orignal locked picture
    }
    
    @IBOutlet weak var sliderView: UIView!
    
    @IBOutlet weak var bigView: UIView!
    
    @IBOutlet weak var sliderBall: UIView!
}
