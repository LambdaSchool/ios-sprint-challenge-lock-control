//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK :- Properties
    
    let lockImage = UIImage(named: "Locked")!
    let unlockedImage = UIImage(named: "Unlocked")!
    
    var isUnlocked: Bool = false
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockImageView: UIImageView!
    
    // MARK :- Functions

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }
    
    private func setupLockScreen(){
        
        
        imageview
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func resetLock(_ sender: Any) {
    }
    
}

