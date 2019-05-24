//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lockView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var customLock: CustomLock!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 233 / 255, green: 235 / 255, blue: 135 / 255, alpha: 1.0)
        lockImageView.image = UIImage(named: "Locked")
        resetButton.isEnabled = false
        customLock.maxX = Int(customLock.frame.width - (sliderView.frame.width / 2))
        customLock.minX = Int(sliderView.center.x)
        setAppearance()
        
        print(sliderView.center)
        print(customLock.frame.width)

    }

    func setAppearance() {
        lockView.layer.cornerRadius = sliderView.frame.width / 2
        customLock.layer.cornerRadius = sliderView.frame.width / 2
        sliderView.layer.cornerRadius = sliderView.frame.width / 2
    }
    
    @IBAction func sliderMoved(_ sender: CustomLock) {
        
        UIView.animate(withDuration: 0.5) {
            self.sliderView.center.x = CGFloat(-sender.xValue)
            print(self.sliderView.center.x)
        }
        if abs(sliderView.center.x) >= abs(customLock.frame.width * 0.80) {
            unlock()
        } else {
            lock()
        }
        
    }
    
    @IBAction func resetLock(_ sender: Any) {
        lock()
    }
    
    func unlock() {
        lockImageView.image = UIImage(named: "Unlocked")
        customLock.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.3) {
            self.sliderView.center.x = 315
        }
        resetButton.isEnabled = true
    }
    
    func lock() {
        lockImageView.image = UIImage(named: "Locked")
        customLock.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.3) {
            self.sliderView.center.x = 35
        }
        
        resetButton.isEnabled = false
    }
    
    
}
