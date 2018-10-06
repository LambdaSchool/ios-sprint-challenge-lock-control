//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockViewController: UIViewController {

    // MARK:- View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        handleLockState()
    }
    
    private func handleLockState() {
        navigationController?.title = lockControl.isLocked ? "Lock 🔐" : "Lock 🔓"
        resetBarButton.isEnabled = lockControl.isLocked ? false : true
        resetBarButton.title = lockControl.isLocked ? "" : "Reset"
    }
    
    
    // MARK:- IBActions
    @IBAction func lockValueChanged(_ lockControl: LockControl) {
        handleLockState()
    }
    
    @IBAction func resetBarButtonItem(_ sender: Any) {
        lockControl.lock()
    }
    
    
    // MARK:- IBOutlets
    @IBOutlet weak var lockControl: LockControl!
    @IBOutlet weak var resetBarButton: UIBarButtonItem!
    
}

