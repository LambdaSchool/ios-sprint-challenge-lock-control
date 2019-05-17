//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var customControlProperties: CustomControl!
    @IBOutlet weak var resetProperties: UIBarButtonItem!
    @IBOutlet weak var thumbNailXConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumbnailProperties: UIView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func customControlValueChanged(_ sender: CustomControl) {
        print(sender.xValue)
        thumbNailXConstraint.constant = CGFloat(sender.xValue * 275.89)
        if sender.xValue > 0.80 {
           triggerUnlockAnimation()
            sender.xValue = Double(customControlProperties.bounds.width)
            customControlProperties.isEnabled = false
        }
    }
    
    @IBAction func resetTheView(_ sender: UIBarButtonItem) {
        print("button tapped")
        self.imageView.image = UIImage(named: "Locked")
        self.view.backgroundColor = .black
        self.resetProperties.tintColor = ThemeHelper.purple
        resetProperties.title = ""
        thumbNailXConstraint.constant = 8
        customControlProperties.isEnabled = true
    }
    
    func setViews(){
        //hide the reset button
        resetProperties.tintColor = ThemeHelper.purple
        resetProperties.title = ""
        thumbnailProperties.backgroundColor = .black
        thumbnailProperties.layer.cornerRadius = 28
        thumbnailProperties.clipsToBounds = true
        thumbnailProperties.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 28
        imageView.clipsToBounds = true
        
        customControlProperties.layer.cornerRadius = 28
        customControlProperties.clipsToBounds = true
        
    }
    
    func triggerUnlockAnimation(){
//        customControlProperties.xValue = 0.0
        
        UIView.animate(withDuration: 1) {
            
        }
        
        UIView.animate(withDuration: 2, animations: {
            self.imageView.image = UIImage(named: "Unlocked")
            self.view.backgroundColor = .yellow
            self.resetProperties.tintColor = .white
            self.resetProperties.title = "RESET"
        }) { (_) in
//            self.thumbNailXConstraint.constant = 0.0
        }
    }
    
}

