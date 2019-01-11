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
        AppearanceHelper.style(view: controlContainerView)
        AppearanceHelper.style(slider: lockSlider)
        lockSlider.setValue(0.05, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var controlContainerView: UIView!
    
    @IBOutlet weak var lockIMageView: UIImageView!
    
    @IBOutlet weak var lockSlider: UISlider!
    
    
    @IBAction func controlLock(_ sender: Any) {
        
    }
}

