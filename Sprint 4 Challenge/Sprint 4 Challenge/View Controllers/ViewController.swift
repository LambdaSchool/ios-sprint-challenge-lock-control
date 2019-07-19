//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lockControl: LockControl!
    @IBOutlet var resetLockButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(nil, animated: true)
    }
    
    @IBAction func resetLockButtonTapped(_ sender: Any) {
        lockControl.reset()
        navigationItem.setRightBarButton(nil, animated: true)

    }
    
    @IBAction func lockControlValueChanged(_ sender: Any) {
        navigationItem.setRightBarButton(resetLockButton, animated: true)
    }

}
