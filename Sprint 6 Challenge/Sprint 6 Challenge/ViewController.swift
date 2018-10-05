//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customLock: LockControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }

    @IBAction func resetLock(_ sender: Any) {
        customLock.reset()
        updateViews()
    }

    @IBAction func unlock(_ sender: Any) {
        updateViews()
    }
    
    
    private func updateViews() {
        title = customLock.isUnlocked ? "Hello!" : "Please unlock."
    }
}

