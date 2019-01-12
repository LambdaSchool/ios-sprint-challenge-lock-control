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
        // Do any additional setup after loading the view, typically from a nib.
        specificAppearance()
    }

//Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var padlockView: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var slider: SpecialSlider!
    
 //
    func specificAppearance() {
        
        //Invisible Reset Button
        resetButton.tintColor = Theme.pompAndPowder
        resetButton.tintColor?.withAlphaComponent(0.0)
        //resetButton.isEnabled = false
        
        //View Appearance
        bgView.layer.cornerRadius = 20
        bgView.clipsToBounds = true
        bgView.backgroundColor = Theme.mikadoYellow
        self.view.backgroundColor = Theme.pompAndPowder

        
        //Slider Appearance
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = UIColor.gray
        slider.maximumTrackTintColor = UIColor.gray
        slider.thumbTintColor = UIColor.black
        slider.isContinuous = true //Value won't change until thumb is done moving
    }
    
//
    
    let unlockedImage = UIImage(named: "Unlocked")!
    var animationArray: [UIImage] = []

    
    func createArray() {
        animationArray.append(unlockedImage)
    }
    
    func animateUnlock(imageView: UIImageView, images: [UIImage]) {
        createArray()
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.startAnimating()
    }
    
    @IBAction func slideToUnlock(_ sender: SpecialSlider) {
        
        if slider.value > 80.0 {
           animateUnlock(imageView: padlockView, images: animationArray)
            slider.isUserInteractionEnabled = false
            resetButton.isEnabled = true
            resetButton.tintColor = Theme.mikadoYellow
        }
    }
    
    @IBAction func pressToReset(_ sender: UIBarButtonItem) {
        
        slider.value = 0
        slider.isUserInteractionEnabled = true
        padlockView.stopAnimating()
        resetButton.isEnabled = false
        resetButton.tintColor = Theme.pompAndPowder
        resetButton.tintColor?.withAlphaComponent(0.0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if slider.value < 80.0 {
            slider.value = 0
        }
    }
    
    
    
}

