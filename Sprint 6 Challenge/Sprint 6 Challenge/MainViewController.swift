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
        
        slider = UISlider(frame: CGRect(x: 20, y:232, width: 260, height: 60))
        slider.center = self.view.center
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = UIColor.cyan
        slider.thumbTintColor = UIColor.red
        slider.isContinuous = true //Slider value changes instantly as thumb is moved vs only when movement is completed.
        self.view.addSubview(slider)
    }
    
    @IBOutlet weak var lockView: UIImageView!
    
    var slider: UISlider!
    
}
