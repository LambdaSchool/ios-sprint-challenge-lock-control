//
//  UnlockViewController.swift
//  Sprint 6 Challenge
//
//  Created by De MicheliStefano on 31.08.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class UnlockViewController: UIViewController {

    var isUnlocked: Bool = false
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var sliderContainerView: SwipeToUnlock!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    var slider = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Add an action when user removes touch
        sliderContainerView.addTarget(self, action: #selector(self.onDragEnd), for: .touchUpInside)
    }
    
    // Changing x position of the slider component while user is dragging it
    @IBAction func sliderDidChangePosition(_ swipeControl: SwipeToUnlock) {
        slider.frame.origin.x = swipeControl.xPosition - 20
    }
    
    // On touch up, determine the position of the slider and either snap it back to initial position or to unlock position
    @objc func onDragEnd(swipeControl: SwipeToUnlock) {
        print("\(swipeControl.xPercentagePosition)")
        if swipeControl.xPercentagePosition < 0.7 {
            UIView.animate(withDuration: 0.5) {
                self.slider.frame.origin.x = self.sliderContainerView.frame.origin.x + 5
                self.lockImageView?.image = UIImage(named: "Locked")
                self.resetButton?.title = ""
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.slider.frame.origin.x = self.sliderContainerView.frame.width - 60
                self.lockImageView?.image = UIImage(named: "Unlocked")
                self.resetButton?.title = "Reset"
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        isUnlocked = false
        UIView.animate(withDuration: 0.5) {
            self.setupViews()
        }
    }
    
    private func setupViews() {
        let sliderHeight: CGFloat = 50.0
        
        // Setup container grey container view
        containerView.layer.cornerRadius = sliderContainerView.bounds.height / 5
        containerView.clipsToBounds = true
        
        // Setup the container view for the round slider
        sliderContainerView.backgroundColor = .gray
        sliderContainerView.layer.cornerRadius = sliderContainerView.bounds.height / 2
        sliderContainerView.clipsToBounds = true
        stackView.addSubview(sliderContainerView)
        
        // Setup slider and add it to the sliderContainerView
        slider.backgroundColor = .black
        slider.frame = CGRect(x: sliderContainerView.frame.origin.x + 5, y: sliderContainerView.frame.origin.y + 5, width: sliderHeight, height: sliderHeight)
        slider.layer.cornerRadius = max(slider.bounds.height, slider.bounds.width) / 2
        slider.clipsToBounds = true
        sliderContainerView.addSubview(slider)
        stackView.addSubview(slider)
        stackView.sendSubview(toBack: slider)
        
        resetButton?.title = isUnlocked ? "Reset" : ""
        lockImageView?.image = isUnlocked ? UIImage(named: "Unlocked") : UIImage(named: "Locked")
    }
    
}
