//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Sean Acres on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class LockControl: UIControl {
    
    var imageView: UIImageView = UIImageView()
    var sliderButton: UIView = UIView()
    
    var minValue = 0.0
    var maxValue = 1.0
    var sliderValue = 0.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        
        // setup view background
        clipsToBounds = true
        layer.cornerRadius = 20
        
        let stackView = UIStackView()
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        // setup imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Locked")
        
        stackView.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150)
            ])
        
        
        
        // setup slider background view
        let sliderBackground = UIView()
        sliderBackground.backgroundColor = .lightGray
        sliderBackground.clipsToBounds = true
        sliderBackground.layer.cornerRadius = 18
        
        stackView.addArrangedSubview(sliderBackground)
        
        NSLayoutConstraint.activate([
            sliderBackground.heightAnchor.constraint(equalToConstant: 40),
            sliderBackground.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            stackView.topAnchor.constraint(equalTo: self.topAnchor)
            ])
        
        
        // setup slider button
        sliderButton.backgroundColor = .black
        sliderButton.frame = CGRect(x: self.bounds.minX + 10, y: self.bounds.maxY - 39, width: 30, height: 30)
        sliderButton.clipsToBounds = true
        sliderButton.layer.cornerRadius = sliderButton.frame.width / 2
        
        self.addSubview(sliderButton)
    }
    
    func updateValue(at touch: UITouch) {
        
        
    }
}



