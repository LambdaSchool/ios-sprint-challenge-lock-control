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
    @IBOutlet weak var thumbSliderLock: ThumbSliderLock!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBarButton.title = ""
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "red-polka-dots")!)
    }
    @IBAction func revealResetButton(_ sender: ThumbSliderLock) {
        resetBarButton.title = "Reset"
    }
    @IBAction func resetButtonWasTapped(_ sender: Any) {
        thumbSliderLock.reset()
        resetBarButton.title = ""
        
    }
    
    

//    func unlock() {
//        lockedUnlockedImage.image = UIImage(named: "Unlock")
//    }
}

