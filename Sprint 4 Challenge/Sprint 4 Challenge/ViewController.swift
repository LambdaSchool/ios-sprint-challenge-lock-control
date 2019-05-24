//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cornerCurve = CGFloat(25)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetUp()
    }
    
    func initalSetUp() {
        lockImage.image = UIImage(named: "Locked")
        mainView.layer.cornerRadius = cornerCurve
        lockImage.layer.cornerRadius = cornerCurve
        sliderTrackView.layer.cornerRadius = cornerCurve / 2
        resetButton.tintColor = .clear
    }
    
    func reset() {
        
        sliderTrackView.reset()
        
        UIView.animate(withDuration: 10) {
            self.lockImage.image = UIImage(named: "Locked")
            self.title = "Locked"
            self.resetButton.tintColor = .clear
            self.sliderTrackView.isEnabled = true
        }
    }
    
    func unlockAnimation() {
        UIView.animate(withDuration: 10) {
            self.lockImage.image = UIImage(named: "Unlocked")
            self.title = "Unlocked!"
            self.resetButton.tintColor = ApperanceHelper.yellowColor
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        reset()
    }
    
    @IBAction func sliderUnlocked(_ sender: UnlockSlider) {
        if sender.ballValue > 0.80 {
            unlockAnimation()
            sender.ballValue = 1
            sliderTrackView.isEnabled = false
        }
    }
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sliderTrackView: UnlockSlider!
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockImage: UIImageView!
}
