//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBAction func lockTouched(_ sender: LockControl) {
        if sender.isLocked == false{
            resetButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
            navigationItem.title = "Slide to Unlock"
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            resetButton.tintColor = .clear


    }

    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockControl: LockControl!

}
