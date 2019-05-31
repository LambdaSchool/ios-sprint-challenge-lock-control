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
        
        setupView()
    }

    func setupView() {
        outsideView.layer.cornerRadius = 20
        if let button = self.navigationItem.rightBarButtonItem {
            button.isEnabled = false
            button.tintColor = UIColor.clear
        }
    }
    
    @IBOutlet weak var outsideView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    
    
}
