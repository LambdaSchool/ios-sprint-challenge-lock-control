//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let unlockedImage = UIImage(named: "Unlocked")!
    var animationArray: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createSlider()
    }
    
    func createSlider() {
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 250, height: 35)
        slider.center = self.view.center
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .black
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.setValue(0, animated: false)
        slider.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        slider.isContinuous = true
        self.view.addSubview(slider)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

