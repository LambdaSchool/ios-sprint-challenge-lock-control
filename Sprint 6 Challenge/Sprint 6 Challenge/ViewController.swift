//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.tintColor = .clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func updateLock(_ slider: CustomControl) {
        
        if !slider.shouldUnlock {
            
        } else {
            lockImageView.image = #imageLiteral(resourceName: "Unlocked")
            
            UIView.animate(withDuration: 0.5) {
                self.resetButton.tintColor = Appearance.textColor
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
        lockImageView.image = #imageLiteral(resourceName: "Locked")
        
        UIView.animate(withDuration: 0.5) {
            self.resetButton.tintColor = .clear
        }
        
        customControl.reset()
    }
}

