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
    @IBOutlet weak var resetButton: UIBarButtonItem! {
        didSet {
            let buttonFrame = CGRect(x: 0, y: 0, width: resetButton.width, height: 30)
            let button = UIButton(frame: buttonFrame)
            button.setTitle("Reset", for: .normal)
            button.setTitleColor(.accentColor, for: .normal)
            button.alpha = 0.0
            button.addTarget(self, action: #selector(resetLock), for: .touchUpInside)
            resetButton.customView = button
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }

   @objc func resetLock(_ sender: Any) {
        customLock.reset()
        updateViews()
    }

    @IBAction func unlock(_ sender: Any) {
        updateViews()
    }
    
    
    private func updateViews() {
        title = customLock.isUnlocked ? "Hello!" : "Please unlock."
        view.backgroundColor = .darkColor
        
        if customLock.isUnlocked {
            UIView.animate(withDuration: 0.3) {
                self.resetButton.customView?.alpha = 1.0
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.resetButton.customView?.alpha = 0.0
            }
        }
    }
}

class NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
}

