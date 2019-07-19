//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resetButton: UIBarButtonItem!
    @IBOutlet var lockControl: LockControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = nil
        self.setupAppearances()
    }

    private func setupAppearances() {
        self.view.backgroundColor = AppearanceHelper.ironManGold
    }
    
    @IBAction func updateLock(_ sender: LockControl) {
        if sender.circleControl.center.x > sender.slideBackground.bounds.width * 0.80 {
            UIView.animate(withDuration: 0.01) {
                sender.imageView.image = UIImage(named: "Unlocked")!
                self.navigationItem.rightBarButtonItem = self.resetButton
            }
        }
    }
    
    @IBAction func resetLock(_ sender: UIBarButtonItem) {
        self.navigationItem.rightBarButtonItem = nil
        lockControl.reset()
    }
}
