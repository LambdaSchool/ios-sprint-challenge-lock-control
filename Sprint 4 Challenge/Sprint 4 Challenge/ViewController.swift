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
    @IBOutlet weak var lockControl: LockControl!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lockImageView.image = UIImage(named: "Locked")
        resetButton.isEnabled = false
        lockControl.maxX = lockControl.frame.width - (sliderView.frame.width / 2)
        lockControl.minX = sliderView.center.x
        setAppearance()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setAppearance() {
        lockView.layer.cornerRadius = lockControl.frame.width / 2
        lockControl.layer.cornerRadius = sliderView.frame.width / 2
        sliderView.layer.cornerRadius = sliderView.frame.width / 2
        
        lockView.backgroundColor = AppearanceHelper.grayish
        view.backgroundColor = AppearanceHelper.blueColor
        lockControl.backgroundColor = UIColor.darkGray
        
        sliderView.layer.shadowColor = UIColor.darkGray.cgColor
        sliderView.layer.shadowOffset = .zero
        sliderView.layer.shadowRadius = 4
        sliderView.layer.shadowOpacity = 1
        
        lockView.layer.shadowColor = UIColor.darkGray.cgColor
        lockView.layer.shadowOffset = .zero
        lockView.layer.shadowRadius = 4
        lockView.layer.shadowOpacity = 1
        
        lockControl.layer.shadowColor = UIColor.darkGray.cgColor
        lockControl.layer.shadowOffset = .zero
        lockControl.layer.shadowRadius = 4
        lockControl.layer.shadowOpacity = 1
    }
                
    @IBAction func sliderMoved(_ sender: LockControl) {
        UIView.animate(withDuration: 0.25) {
            self.sliderView.center.x = CGFloat(-sender.x)
            
            }
        if sender.x >= -(sliderView.frame.width * 0.80 - sender.frame.width) {
            unlock()
        } else if sender.x <= (sliderView.frame.width * 0.05) && sender.x != 0 {
            lock()
        } else {
            lock()
        }
                    
    }
                
    @IBAction func resetLock(_ sender: UIBarButtonItem) {
        lock()
    }
                
    func unlock() {
            lockImageView.image = UIImage(named: "Unlocked")
            lockControl.isUserInteractionEnabled = false
            UIView.animate(withDuration: 0.3) {
            self.sliderView.center.x = self.sliderView.frame.maxX * (-1.08)
            
            }
        resetButton.isEnabled = true
    }
                
    func lock() {
            lockImageView.image = UIImage(named: "Locked")
            lockControl.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0.18) {
                self.sliderView.center.x = 35
        }
                    
        resetButton.isEnabled = false
    }
    
}
