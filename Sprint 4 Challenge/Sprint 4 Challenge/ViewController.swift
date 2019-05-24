//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }

    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var masterView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var customControlView: CustomControl!
    
    let cornerCurve = CGFloat(25)
    
    func initialSetup() {
        lockImageView.image = UIImage(named: "Locked")
        masterView.layer.cornerRadius = cornerCurve
        masterView.backgroundColor = AppearanceHelper.offWhite
        lockImageView.layer.cornerRadius = cornerCurve
        customControlView.layer.cornerRadius = cornerCurve / 2
        customControlView.backgroundColor = AppearanceHelper.lambdaMaroon
        resetButton.tintColor = .clear
    }
    
    @IBAction func touchUnlock(_ sender: CustomControl) {
        if customControlView.ballValue > 0.80 {
            unlockAnimation()
            customControlView.isEnabled = false
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
    func unlockAnimation() {
        UIView.animate(withDuration: 10) {
            self.lockImageView.image = UIImage(named: "Unlocked")
            self.title = "Unlocked!"
            self.resetButton.tintColor = AppearanceHelper.offWhite
        }
    }
    
    
    func reset() {
        UIView.animate(withDuration: 10) {
            self.lockImageView.image = UIImage(named: "Locked")
            self.title = "Locked"
            self.resetButton.tintColor = .clear
            self.customControlView.isEnabled = true
            
        }
    }
}
