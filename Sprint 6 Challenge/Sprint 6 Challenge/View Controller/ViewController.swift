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
    @IBOutlet weak var lockControl: LockControl!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    // MARK: - View Loading
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isViewLoaded {
            resetButton.title = ""
        }
    }
    // MARK: - Actions
    @IBAction func resetLock(_ sender: Any) {
        resetButton.title = ""
    }
}

