//
//  CustomLock.swift
//  Sprint 6 Challenge
//
//  Created by Jeffrey Carpenter on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomLock: UIControl {
    
    var bgColor = #colorLiteral(red: 0.8117647767, green: 0.8235294819, blue: 0.8196079135, alpha: 1)
    var sliderColor = #colorLiteral(red: 0.1490196139, green: 0.160784319, blue: 0.1725490242, alpha: 1)
    var sliderBgColor = #colorLiteral(red: 0.2784313858, green: 0.2980392277, blue: 0.3215686381, alpha: 1)
    
    var imageView: UIImageView!
//    var sliderView: UIView
//    var slider: UIView
    
    var isLocked = true
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        layer.cornerRadius = 50
        layer.backgroundColor = bgColor.cgColor
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        
        // Add UIImageView
        
        setupImageView()
        
        // Add UIView (sliderbg)
        
        // Add UIView (slider)
    }
    
    private func setupImageView() {
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "Locked")
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let imageWidthContraint = NSLayoutConstraint(item: imageView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        let imageHeightContraint = NSLayoutConstraint(item: imageView!, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1, constant: 0)
        let imageCenterXConstraint = NSLayoutConstraint(item: imageView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let imageCenterYConstraint = NSLayoutConstraint(item: imageView!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -30)
        
        NSLayoutConstraint.activate([imageWidthContraint, imageHeightContraint, imageCenterXConstraint, imageCenterYConstraint])
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
