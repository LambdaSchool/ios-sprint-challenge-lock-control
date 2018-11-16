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
        locking()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func lockAction(_ lock: Lock) {
       locking()
       
    }
    
    
    @IBOutlet var lockingAction: Lock!
    
    
    @IBAction func reset(_ sender: Any) {
      lockingAction.open()
    }
    
    
    private func locking(){
         resetBButton.title = lockingAction.isLocked ? "" : "Reset"
        resetBButton.isEnabled = lockingAction.isLocked ? false : true
        
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var resetBButton: UIBarButtonItem!
 
    
}

