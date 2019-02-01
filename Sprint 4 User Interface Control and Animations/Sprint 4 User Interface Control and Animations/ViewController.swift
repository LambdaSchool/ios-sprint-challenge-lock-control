//
//  ViewController.swift
//  Sprint 4 User Interface Control and Animations
//
//  Created by Jaspal on 2/1/19.
//  Copyright © 2019 Jaspal Suri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.backgroundColor = UIColor.gray
        lockImage.image = CustomControl.lockStateImage
    }

    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var lockImage: UIImageView!

}

