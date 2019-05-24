//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBAction func lockControlChanged(_ sender: Any) {
        if lockControl.isLocked == false{
            resetButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        if lockControl.isLocked == true {
            resetButton.tintColor = .clear
        }
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        lockControl.resetLock()
        resetButton.tintColor = .clear
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let lockControl = lockControl else { return }
            lockControl.setupView()
            lockControl.setupImage()
            lockControl.setupSliderTrack()
            lockControl.setupThumb()
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            navigationItem.title = "SlideToUnlock"
            resetButton.tintColor = .clear

    }

    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockControl: LockControl!

}
