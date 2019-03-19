//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK :- Properties
    
    let rangeSlider = SwipeUnlocker(frame: CGRect.zero)
    let imageView = UIImageView(image: UIImage(named: "Locked")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rangeSlider.backgroundColor = UIColor.lightGray
        
        view.addSubview(rangeSlider)
        
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 64),
//            imageView.topAnchor.constraintEqualToSystemSpacingBelow(view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
//            imageView.leftAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        imageView.contentMode = .center
        
        rangeSlider.addTarget(self, action: #selector(self.rangeSliderValueChanged(rangeSlider:)), for: .touchUpInside)
//        rangeSlider.addTarget(self, action: #selector("rangeSliderValueChanged"), for: .valueChanged)
//        rangeSlider.addTarget(self, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + view.frame.width,
                                   width: width, height: 31.0)
    }
    
    @objc func rangeSliderValueChanged(rangeSlider: SwipeUnlocker){
        print("Range slider value changed: (\(rangeSlider.lowerValue))")
    }
}




