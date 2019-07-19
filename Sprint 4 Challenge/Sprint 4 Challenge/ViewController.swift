//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var lockControl: LockControl!
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false

                setAppearance()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setAppearance() {
        view.backgroundColor = AppearanceHelper.blueColor
        lockControl.backgroundColor = AppearanceHelper.grayish
        
        lockControl.layer.shadowColor = UIColor.darkGray.cgColor
        lockControl.layer.shadowOffset = .zero
        lockControl.layer.shadowRadius = 4
        lockControl.layer.shadowOpacity = 1
    }
                
    @IBAction func sliderMoved(_ sender: LockControl) {
        resetButton.isEnabled = true

    }
    
    @IBAction func resetLock(_ sender: UIBarButtonItem) {
        lockControl.resetSlider()
        self.resetButton.isEnabled = false
    }
                
    
}
