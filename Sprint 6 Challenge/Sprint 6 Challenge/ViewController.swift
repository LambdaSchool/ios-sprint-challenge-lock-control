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


        resetButton.title = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
         imageView.image = UIImage(named: "Locked")
    }

    @IBAction func resetButtonTapped(_ sender: UIBarButtonItem) {
    }

    @IBAction func lockSwiper(_ sender: CustomControl) {
        if CustomControl.Xvalue > 0.80 {
            imageView.image = UIImage(named: "Unlocked")
            resetButton.title = "Reset"
            CustomControl.Xvalue = 1.0
        } else {
            CustomControl.Xvalue = 0.0
            resetButton.title = nil
            imageView.image = UIImage(named: "Locked")
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!





}

