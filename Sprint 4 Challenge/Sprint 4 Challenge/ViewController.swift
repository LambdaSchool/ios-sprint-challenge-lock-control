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
        
        setUpGraySquare()
        rangeSlider?.sliderAreaSize
    }
    
    @IBAction func resetLock(_ sender: Any) {
        
        
        
        // 1.  send lock animation back to identity
        // 2.  rangeSlider ball goes back to zero
        // 3.  vanish the Reset button
    }
    
    @IBAction func sliderBallControl(_ sender: Any) {
        
    }
    
    
    func setUpGraySquare() {
        
        let graySquare = UIView()
        graySquare.backgroundColor = .gray
        graySquare.clipsToBounds = true
        graySquare.layer.cornerRadius = 32
        graySquare.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(graySquare)
        
        let grayLeadingConstraint = graySquare.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        let grayBottomConstraint = graySquare.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -256)
        let grayHeightConstraint = graySquare.heightAnchor.constraint(equalToConstant: 320)
        let grayAspectRatioConstraint = graySquare.widthAnchor.constraint(equalTo: graySquare.heightAnchor, multiplier: 1.0, constant: 0)

        
        NSLayoutConstraint.activate(
            [
                grayLeadingConstraint,
                grayBottomConstraint,
                grayHeightConstraint,
                grayAspectRatioConstraint
            ])
    }
    
    var graySquare: UIView?
    var rangeSlider: RangeSlider?
}
