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
        lockImageView.image = UIImage(named: "Locked")
        
    }

    @IBOutlet weak var masterView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var ballView: UIView!
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        resetButton()
    }
    
    func unlockAnimation() {
        title = "Unlocked!"
    }
    
    
    func resetButton() {
        title = "Locked"
    }
    
}
