//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var customLock: LockControl!
    // The only way I could figure out to animate the bar button item was to create a custom view for it. So that's what I did.
    @IBOutlet weak var resetButton: UIBarButtonItem! {
        didSet {
            // Get the frame. I guessed on the height, because barButtonItems don't have a height for some reason.
            let buttonFrame = CGRect(x: 0, y: 0, width: resetButton.width, height: 30)
            //Set up the button
            let button = UIButton(frame: buttonFrame)
            button.setTitle("Reset", for: .normal)
            button.setTitleColor(.accentColor, for: .normal)
            button.alpha = 0.0
            button.addTarget(self, action: #selector(resetLock), for: .touchUpInside)
            //Add it as the custom view of the bar button
            resetButton.customView = button
            
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkColor
        updateViews()
    }

    // MARK: - UI Methods
    @objc func resetLock(_ sender: Any) {
        customLock.reset()
        updateViews()
    }

    @IBAction func unlock(_ sender: Any) {
        updateViews()
    }
    
    // MARK: - Utility Methods
    private func updateViews() {
        title = customLock.isUnlocked ? "Hello!" : "Please unlock."
        
        if customLock.isUnlocked {
            // If it is unlocked, make the reset button visible
            UIView.animate(withDuration: 0.3) {
                self.resetButton.customView?.alpha = 1.0
            }
        } else {
            // Otherwise, make it invisible
            UIView.animate(withDuration: 0.3) {
                self.resetButton.customView?.alpha = 0.0
            }
        }
    }
}

// Custom navigation controller just to set the status bar style? There might be a better way to do this, but I didn't think it was worth making a whole other file just to add this one line.
class NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
}

