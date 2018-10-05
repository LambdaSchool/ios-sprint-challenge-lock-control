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

    let lockedImage = UIImage(named: "Locked")!
    let unlockedImage = UIImage(named: "Unlocked")!
    
    var isUnlocked: Bool = false
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    
    // MARK :- Functions

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupLockScreen()
        
    }
    
    private func setupLockScreen(){
        
        let lockImageView = UIImageView()
        lockImageView.image = lockedImage
        
        let containerViewFrame = CGRect(x: 0, y: 0, width: 350, height: 350.0)
        let containerView = UIView(frame: containerViewFrame)
        containerView.center.x = view.center.x
        containerView.center.y = view.center.y
        containerView.backgroundColor = .gray
        
//        lockImageView.image = lockImage
//        lockImageView.contentMode = .scaleAspectFit
        let imageViewFrame = CGRect(x: 0, y: 0, width: lockedImage.size.width, height: lockedImage.size.height)
        lockImageView.frame = imageViewFrame
        lockImageView.center.x = containerView.frame.width / 2
        lockImageView.layoutIfNeeded()
        
        containerView.addSubview(lockImageView)
        view.addSubview(containerView)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func resetLock(_ sender: Any) {
    }
    
}

