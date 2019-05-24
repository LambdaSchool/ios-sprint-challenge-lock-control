//
//  LockScreenViewController.swift
//  Sprint 4 Challenge
//
//  Created by Diante Lewis-Jolley on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

    }

    private func setupViews() {

        thumbSliderView.layer.cornerRadius = 10
        thumbSliderView.clipsToBounds = true
        thumbNail.backgroundColor = ThemeHelper.customPurple
        thumbNail.layer.cornerRadius = 10
        thumbNail.clipsToBounds = true
        resetButton.title = "Locked"
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
    }
    
    @IBAction func customControlUnlocked(_ sender: CustomControl) {

        print(sender.xValue)
        // This should move view with the tracking touchValue given by sender

        thumbNailTrailingContraint.constant = CGFloat(sender.xValue * 235.0)
        if sender.xValue > 0.80 {
            // this should trigger the unlock animation if the view hits the bounds of the custom control
            unlockAnimation()
            sender.xValue = Double(customControl.bounds.width)
            customControl.isEnabled = false
        }
    }

    private func unlockAnimation() {
        UIView.animate(withDuration: 1) {
            self.imageView.image = UIImage(named: "Unlocked")
            self.resetButton.title = "Reset"
            self.title = "Unlocked"
        }

    }



    @IBAction func resetLockButtonTapped(_ sender: Any) {

        resetButton.title = "Locked"
        imageView.image = UIImage(named: "Locked")
        thumbNailLeadingContraint.constant = 0

    }


    @IBOutlet weak var thumbNail: UIView!
    @IBOutlet weak var thumbNailTrailingContraint: NSLayoutConstraint!
    @IBOutlet weak var thumbNailLeadingContraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var thumbSliderView: UIView!

}
