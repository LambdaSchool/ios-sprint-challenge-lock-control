//
//  MainViewController.swift
//  Sprint 6 Challenge
//
//  Created by Lotanna Igwe-Odunze on 12/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider = UISlider(frame: CGRect(x: 20, y: 232, width: 260, height: 60))
        slider.center = self.view.center
        //slider.trackRect(forBounds: CGRect(x: 20, y: 232, width: 260, height: 60))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = UIColor.gray
        slider.maximumTrackTintColor = UIColor.gray
        slider.thumbTintColor = UIColor.black
        slider.isContinuous = true //Slider value changes instantly as thumb is moved vs only when movement is completed.
        
        slider.addTarget(self, action: #selector(sliderMoved(sender:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(slider)
        
        addImages()
        
    }
    
    @IBOutlet weak var lockView: UIImageView!
    
    var slider: UISlider!
    
    var lockImages: [UIImage] = [] //Array of images to be animated
    
    
    //Add the padlock images to the array above
    func addImages() -> [UIImage] {
        //let lockedImage = UIImage(named: "Locked")!
        let unlockedImage = UIImage(named: "Unlocked")!
        //lockImages.append(lockedImage)
        lockImages.append(unlockedImage)
        return lockImages
        
    }
    
    //Animate the padlock unlocking
    func unlock(imageView: UIImageView, images: [UIImage]) {
       
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
        
    }
    
    //Triggering the animation with the slider
    @objc func sliderMoved(sender: UISlider) {
        
        if slider.value > 80.0 {
        unlock(imageView: lockView, images: lockImages) }
    }

}
