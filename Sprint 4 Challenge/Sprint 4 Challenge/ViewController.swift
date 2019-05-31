//
//  ViewController.swift
//  Lock(Sprint 4)
//
//  Created by Jordan Davis on 5/31/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "Locked")
        lockButton.title = ""
        setAppearance()
        AppearanceHelper.setCustomAppearance()
    }
    
    
    @IBAction func ballValueChanged(_ sender: CustomControl) {
        if customControl.isUnlocked {
            imageView.image = UIImage(named: "Unlocked")
            customControl.isUserInteractionEnabled = true
            lockButton.title = "Lock"
            navigationItem.title = "Unlocked!"
        }
    }
    
    @IBAction func lock(_ sender: UIBarButtonItem) {
        customControl.reset()
        imageView.image = UIImage(named: "Locked")
        lockButton.title = ""
        navigationItem.title = "Slide To Unlock"
    }
    
    func setAppearance() {
        overallView.layer.cornerRadius = 30
        sliderView.layer.cornerRadius = 20
        overallView.layer.shadowOffset = CGSize.zero
        overallView.layer.shadowRadius = 5
        overallView.layer.shadowColor = UIColor.black.cgColor
        overallView.layer.shadowOpacity = 1
    }
    
    
    //MARK: - Properties
    
    @IBOutlet weak var overallView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var lockButton: UIBarButtonItem!
    

}

extension UIColor {
    
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static let smokeGray = UIColor(214, 214, 214)
    static let marvelRed = UIColor(137, 10, 24)
}

