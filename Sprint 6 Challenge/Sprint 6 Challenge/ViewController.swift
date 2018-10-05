//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customControl: CustomControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        lockedImage.layer.cornerRadius = 40
        swipeControl.layer.cornerRadius = 40
        swipeControl.backgroundColor = .gray
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        guard let custom = customControl else { return }
        custom.dot.isUserInteractionEnabled = true
        resetButton.setTitle("Reset", for: .normal)
    }
    
    @IBOutlet weak var resetButton: UIButton!
    //@IBOutlet weak var backView: UIView!
    @IBOutlet weak var lockedImage: UIImageView!
    @IBOutlet weak var swipeControl: UIView!

}

