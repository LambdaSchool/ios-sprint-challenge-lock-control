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
        self.navigationItem.rightBarButtonItem = nil
    }

    @IBAction func reset(_ sender: Any) {
        sliderView.xPosition = sliderView.bounds.minX + 38
        circle.center.x = sliderView.xPosition
        updateViews()
    }
    
    @IBAction func locking(_ sender: Slider) {
        
        UIView.animate(withDuration: 0.2) {
            self.circle.center.x = sender.xPosition
        }
        updateViews()
    }
    
    private func updateViews() {
        
        if sliderView.xPosition > (sliderView.bounds.maxX / 10) * 7 {
            lock.isLocked = true
            title = "Locked"
            lock.image = UIImage(named: "Locked")
            self.navigationItem.rightBarButtonItem = resetButton
        } else {
            lock.isLocked = false
            title = "Unlocked"
            lock.image = UIImage(named: "Unlocked")
            self.navigationItem.rightBarButtonItem = nil
        }
        
        lockImage.image = lock.image
    }

    // MARK: - Properties
    
    var lock = Lock()
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockContainer: UIView!
    @IBOutlet weak var sliderView: Slider!
}

