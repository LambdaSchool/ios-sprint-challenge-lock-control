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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    
    
    @IBAction func updateLockValue(_ sender: CustomControl) {
        if sender.isLocked == true {
            let imageView = UIImageView(image: lockedImage)
            imageView.frame = CGRect(x: 67, y: 200, width: 100, height: 200)
            sender.addSubview(imageView)
        }
    }
    
    @IBAction func resetTapped(_ sender: UIBarButtonItem) {
        let imageView = UIImageView(image: lockedImage)
        imageView.frame = CGRect(x: 67, y: 200, width: 100, height: 200)
        view.addSubview(imageView)
    }
    

}

