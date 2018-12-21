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
        
        //Create the slider as soon as the view loads
        slider = UISlider(frame: CGRect(x: 20, y: 232, width: 260, height: 20))
        slider.center = self.view.center
        //slider.trackRect(forBounds: CGRect(x: 20, y: 232, width: 260, height: 60))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = UIColor.gray
        slider.maximumTrackTintColor = UIColor.gray
        slider.thumbTintColor = UIColor.black
        slider.isContinuous = false //Slider value changes instantly as thumb is moved if true, or only when movement is completed if false.
        slider.addTarget(self, action: #selector(sliderMoved(sender:)), for: UIControlEvents.valueChanged) //Makes slider target function below.
        self.view.addSubview(slider)
        
        addImages() //Creates the animation array as sson as the view loads
        
    }
    
    @IBOutlet weak var lockView: UIImageView!
    
    var slider: UISlider!
    
    var lockImages: [UIImage] = [] //Array of images to be animated
    
    
    //Add the padlock images to the array above
    func addImages(){
        //let lockedImage = UIImage(named: "Locked")!
        let unlockedImage = UIImage(named: "Unlocked")!
        //lockImages.append(lockedImage)
        lockImages.append(unlockedImage)
    }
    
    //Animate the padlock unlocking
    func unlock(imageView: UIImageView, images: [UIImage]) {
       
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        //imageView.animationRepeatCount = 1
        imageView.startAnimating()
        
    }
    
    //Triggering the animation with the slider
    @objc func sliderMoved(sender: UISlider) {
        
        if slider.value > 80.0 {
        unlock(imageView: lockView, images: lockImages) }
    }

}
