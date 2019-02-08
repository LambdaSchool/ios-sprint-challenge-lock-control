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
        sliderLeadingConstraint.constant = 0
        setAppearance()
    }
    
    @IBAction func lockDraggedOrTapped(_ sender: LockControl) {
        sender.maxValue = sliderContainer.frame.width - slider.frame.width
        sliderLeadingConstraint.constant = sender.value - (slider.frame.width / 2)
        
        if sender.value >= (sliderContainer.frame.width * 0.8 - slider.frame.width) {
            unlockAnimation()
            sliderContainer.isUserInteractionEnabled = false
        } else if sender.value <= (sliderContainer.frame.width * 0.05) && sender.value != 0 {
            lockAnimation()
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIBarButtonItem) {
        lockAnimation()
        sliderContainer.isUserInteractionEnabled = true
    }
    
    
    func setAppearance() {
        slider.layer.cornerRadius = slider.frame.width / 2
        sliderContainer.layer.cornerRadius = slider.frame.width / 2
        outerContainer.layer.cornerRadius = slider.frame.width / 2
        lockImage.image = UIImage(named: "Locked")
        sliderContainer.backgroundColor = AppearanceHelper.carminePink
        slider.backgroundColor = AppearanceHelper.linen
        outerContainer.backgroundColor = AppearanceHelper.vividTangerine
        view.backgroundColor = AppearanceHelper.carminePink
        self.resetButton.tintColor = .clear
        self.resetButton.isEnabled = false
    }
    
    func unlockAnimation() {
        
        UIView.animate(withDuration: 1.0) {
            self.lockImage.image = UIImage(named: "Unlocked")
            self.view.backgroundColor = AppearanceHelper.vividTangerine
            self.outerContainer.backgroundColor = AppearanceHelper.linen
            self.slider.backgroundColor = AppearanceHelper.vividTangerine
            self.sliderLeadingConstraint.constant = self.sliderContainer.frame.width - self.slider.frame.width
            self.resetButton.tintColor = AppearanceHelper.linen
            self.resetButton.isEnabled = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    func lockAnimation() {
        
        UIView.animate(withDuration: 0.5) {
            self.lockImage.image = UIImage(named: "Locked")
            self.view.backgroundColor = AppearanceHelper.carminePink
            self.outerContainer.backgroundColor = AppearanceHelper.vividTangerine
            self.slider.backgroundColor = AppearanceHelper.linen
            self.sliderLeadingConstraint.constant = 0
            self.resetButton.tintColor = .clear
            self.resetButton.isEnabled = false
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var outerContainer: UIView!
    @IBOutlet weak var slider: UIView!
    @IBOutlet weak var sliderContainer: LockControl!
    @IBOutlet weak var sliderLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
}

