//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var lockImage: UIImageView!
    
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Appearance.setUpNavBar()        
    }
}

