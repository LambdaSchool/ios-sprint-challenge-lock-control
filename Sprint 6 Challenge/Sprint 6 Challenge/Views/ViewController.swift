//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var sliderContainer: Slider!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    var isUnlocked = false
    var slider = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    
    @objc func didDrag(swipeControl: Slider) {
        if swipeControl.xPercentagePosition < 0.7 {
            UIView.animate(withDuration: 0.5) {
                self.slider.frame.origin.x = self.sliderContainer.frame.origin.x + 5
                self.imageView.image = UIImage(named: "Locked")
                self.resetButton?.title = ""
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.slider.frame.origin.x = self.sliderContainer.frame.width - 60
                self.imageView.image = UIImage(named: "Unlocked")
                self.resetButton?.title = "Reset"
            }
        }
    }
    
    func setUpViews() {
        setUpSliderContainer()
        setUpContainer()
        setUpSlider()
    }
    
    func setUpSliderContainer() {
        
    }
    
    func setUpContainer() {
        
    }
    
    func setUpSlider() {
        
    }
}

