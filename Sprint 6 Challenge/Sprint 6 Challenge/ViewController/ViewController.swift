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
        
    }

    @IBAction func locking(_ sender: Slider) {
        
        
    }

    // MARK: - Properties
    
    var lock = Lock()
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var lockContainer: UIView!
}

