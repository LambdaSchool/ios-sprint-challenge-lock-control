//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lockControl: LockControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearances()
    }

    private func setupAppearances() {
        self.view.backgroundColor = AppearanceHelper.ironManGold
    }
    
    @IBAction func updateLock(_ sender: LockControl) {
        // change from locked to unlocked
    }
}
