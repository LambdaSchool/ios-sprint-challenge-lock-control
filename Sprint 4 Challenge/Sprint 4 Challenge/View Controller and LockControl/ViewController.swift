//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockControl: LockControl!
    
    // MARK: - View Loading
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setRightBarButton(nil, animated: true)
    }

    // MARK: - Actions
    @IBAction func resetLock(_ sender: Any) {
        lockControl.reset()
        navigationItem.setRightBarButton(nil, animated: true)
    }
    
    @IBAction func unlocked(_ sender: LockControl) {
        navigationItem.setRightBarButton(resetButton, animated: true)
    }
    
}
