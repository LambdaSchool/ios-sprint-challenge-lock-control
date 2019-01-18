//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Ivan Caldwell on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var padlockImage: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        resetButton.title = ""
        resetButton.isEnabled = false
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func updateImage(_ sender: CustomControl) {
        
    }
}
