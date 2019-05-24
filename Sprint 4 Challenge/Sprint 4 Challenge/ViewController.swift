//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var lockSetup: LockSetup!
    
    func updateResetButton() {
        if lockSetup.locked == true {
            resetButtonNotEnabled()
        } else {
            resetButtonIsEnabled()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateResetButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        updateResetButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    @IBAction func resetEnableAction(_ sender: LockSetup) {
//        if sender.locked {
//            resetButtonNotEnabled()
//        } else {
//            resetButtonIsEnabled()
//        }
//
//    }
    
    @IBAction func resetButtonPushed(_ sender: Any) {
        lockSetup.reset()
    }
    
    @IBAction func resetButtonEnabledToggle(_ sender: Any) {
        updateResetButton()
    }
    
    func resetButtonIsEnabled() {
        
    self.resetButton.isEnabled = true
    self.resetButton.tintColor = .black
        
    }
    
    func resetButtonNotEnabled() {
        
    self.resetButton.isEnabled = false
    self.resetButton.tintColor = .clear
        
    }
    

    
    
    
    
}
