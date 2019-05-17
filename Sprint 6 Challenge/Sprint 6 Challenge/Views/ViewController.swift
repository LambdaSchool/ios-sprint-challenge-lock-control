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
        sliderContainer.addTarget(self, action: #selector(self.didDrag), for: .touchUpInside)
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
        setUpContainer()
        setUpSliderContainer()
        setUpSlider()
        resetButton?.title = isUnlocked ? "Reset" : ""
        imageView?.image = isUnlocked ? UIImage(named: "Unlocked") : UIImage(named: "Locked")
    }
    
    func setUpSliderContainer() {
        sliderContainer.backgroundColor = .gray
        sliderContainer.layer.cornerRadius = sliderContainer.bounds.height / 2
        sliderContainer.clipsToBounds = true
        stackView.addSubview(sliderContainer)
    }
    
    func setUpContainer() {
        container.layer.cornerRadius = sliderContainer.bounds.height / 5
        container.center.x = view.frame.width / 2
        container.center.y = view.frame.height / 2
        container.clipsToBounds = true
    }
    
    func setUpSlider() {
        slider.backgroundColor = .black
        slider.frame = CGRect(x: sliderContainer.frame.origin.x + 5, y: sliderContainer.frame.origin.y + 5, width: 50.0, height: 50.0)
        slider.layer.cornerRadius = max(slider.bounds.height, slider.bounds.width) / 2
        slider.clipsToBounds = true
        sliderContainer.addSubview(slider)
        stackView.addSubview(slider)
        stackView.sendSubview(toBack: slider)
    }
    
   
    @IBAction func sliderChanged(_ sender: Any) {
    }
    
    
    @IBAction func reset(_ swipeControl: Slider) {
        isUnlocked = false
        UIView.animate(withDuration: 0.5) {
            self.setUpViews()
        }
    }
}

