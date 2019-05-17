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
    var sliderBgColor = #colorLiteral(red: 0.6549019814, green: 0.6588235497, blue: 0.6549019814, alpha: 1)
    
    var imageView: UIImageView!
    var slider: UIView!
    
    var isLocked = true
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 280, height: 280)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        
        // Setup UIView aspects (self)
        
        clipsToBounds = true
        layer.cornerRadius = 50
        layer.backgroundColor = bgColor.cgColor
        
        // Add UIImageView (imageView)
        
        setupImageView()
        
        // Add UIView (sliderView)
        
        setupSliderView()
        
        // Add UIView (slider)
        
        setupSlider()
    }
    
    private func setupSlider() {
        
        slider = UIView()
        slider.frame = CGRect(x: 20, y: intrinsicContentSize.height - 60 - 20, width: 60, height: 60)
        slider.layer.cornerRadius = slider.frame.width / 2
        slider.backgroundColor = sliderColor
        slider.isUserInteractionEnabled = false
        self.addSubview(slider)
    }
    
    private func setupSliderView() {
        
        let sliderView = UIView()
        sliderView.frame = CGRect(x: 10, y: intrinsicContentSize.height - 80 - 10, width: intrinsicContentSize.width - 20, height: 80)
        sliderView.layer.cornerRadius = sliderView.frame.height / 2
        sliderView.backgroundColor = sliderBgColor
        sliderView.isUserInteractionEnabled = false
        addSubview(sliderView)
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
