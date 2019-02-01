//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var slider: CustomControl!
    @IBOutlet weak var sliderConstraint: NSLayoutConstraint!
    @IBOutlet weak var lockImage: UIImageView!
    var sliderStartingPosition : CGPoint = CGPoint()
    @IBAction func sliderTouched(_ sender: CustomControl) {
        if(sliderConstraint.constant < 226){
            self.sliderConstraint.constant += sender.amountDragged
        }else{
            lockImage.image = UIImage(named: "Unlocked")
            navigationBar.rightBarButtonItem?.title = "Reset"
        }
    }
    @IBAction func touchedStopped(_ sender: Any) {
        if(sliderConstraint.constant < 226){
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    self.slider.center = self.sliderStartingPosition
                })
            }, completion: nil)
            sliderConstraint.constant = 8
            slider.amountDragged = 0
        }
    }
    @IBAction func resetButton(_ sender: Any) {
        lockImage.image = UIImage(named: "Locked")
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.slider.center = self.sliderStartingPosition
            })
        }, completion: nil)
        sliderConstraint.constant = 8
        slider.amountDragged = 0
        navigationBar.rightBarButtonItem?.title = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.rightBarButtonItem?.title = ""
        sliderStartingPosition = slider.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

