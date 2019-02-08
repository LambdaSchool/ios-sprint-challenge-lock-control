//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Paul Yi on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var isUnlocked = false
    
    // Properties for the views in the control
    var circleView: UIView!
    var imageView: UIImageView!
    
    // This method tells Auto Layout how big your custom control should be
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 280, height: 280)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        
        clipsToBounds = true
        self.layer.cornerRadius = 50
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "Locked")
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        let imageWidthConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .width,
                                                      relatedBy: .equal, toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 150.0)
        
        let imageHeightConstraint = NSLayoutConstraint(item: imageView,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: imageView,
                                                       attribute: .width,
                                                       multiplier: 1.0,
                                                       constant: 0.0)
        
        let imageCenterXConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .centerX,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .centerX,
                                                        multiplier: 1.0,
                                                        constant: 0.0)
        
        let imageTopConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .top,
                                                    multiplier: 1.0,
                                                    constant: 20.0)
        
        NSLayoutConstraint.activate([imageWidthConstraint, imageHeightConstraint, imageCenterXConstraint, imageTopConstraint])
        
        let sliderView = UIView(frame: CGRect(x: 10, y: intrinsicContentSize.height - 80 - 10, width: intrinsicContentSize.width - 20, height: 80))
        sliderView.layer.cornerRadius = 40
        sliderView.backgroundColor = UIColor(red: 134.0/255.0, green: 163.0/255.0, blue: 212.0/255.0, alpha: 1.0)
        sliderView.isUserInteractionEnabled = false
        self.addSubview(sliderView)
        
        circleView = UIView(frame: CGRect(x: 20, y: intrinsicContentSize.height - 60 - 20, width: 60, height: 60))
        circleView.layer.cornerRadius = 30
        circleView.backgroundColor = UIColor(red: 98.0/255.0, green: 119.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        circleView.isUserInteractionEnabled = false
        self.addSubview(circleView)
    }
    

   
    
}
