//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetBarButton: UIBarButtonItem!
    @IBOutlet weak var customControl: CustomControl!
    
    @IBAction func updateLock(_ control: CustomControl) {
        
        let value = control.locked
        if value == 1 {
            self.title = ("Locked")
        } else {
            self.title = ("Unlocked")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        resetBarButton.isEnabled = false
//        resetBarButton.tintColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func resetCustomControl(_ sender: Any) {
        customControl.reset()
    }
    

}

