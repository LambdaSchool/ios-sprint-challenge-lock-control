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
    var sliderBackground = UIView()
    
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
        stackView.isUserInteractionEnabled = false
        stackView.spacing = 8
        
        // setup imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Locked")
        imageView.isUserInteractionEnabled = false
        
        stackView.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 150)
            ])
        
        // setup slider background view
        sliderBackground.backgroundColor = .lightGray
        sliderBackground.clipsToBounds = true
        sliderBackground.layer.cornerRadius = 18
        sliderBackground.isUserInteractionEnabled = false
        sliderBackground.translatesAutoresizingMaskIntoConstraints = false
        
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
        sliderButton.translatesAutoresizingMaskIntoConstraints = false
        sliderButton.backgroundColor = .black
        sliderButton.frame = CGRect(x: self.bounds.minX + 10, y: self.bounds.maxY - 39, width: 30, height: 30)
        sliderButton.clipsToBounds = true
        sliderButton.isUserInteractionEnabled = false
        sliderButton.layer.cornerRadius = sliderButton.frame.width / 2
        
        self.addSubview(sliderButton)
    }
    
    
    func updateValue(at touch: UITouch) {
        let touchLocation = touch.location(in: self)
        let adjustedSliderBackgroundFrame = CGRect(x: sliderBackground.frame.minX + 4, y: sliderBackground.frame.minY, width: sliderBackground.frame.width - 37, height: sliderBackground.frame.height)
        
        if adjustedSliderBackgroundFrame.contains(touchLocation) {
            sliderButton.frame = CGRect(x: touchLocation.x, y: self.bounds.maxY - 39, width: 30, height: 30)
        }
        
    }
    
    func reset() {
        sliderButton.frame = CGRect(x: self.bounds.minX + 10, y: self.bounds.maxY - 39, width: 30, height: 30)
        imageView.image = UIImage(named: "Locked")
        self.isUserInteractionEnabled = true
    }
}


extension LockControl {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if sliderButton.bounds.contains(touchPoint) {
            sendActions(for: [.touchDown])
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if sliderBackground.frame.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if touchPoint.x >= (sliderBackground.frame.maxX - 33) * 0.8 {
            imageView.image = UIImage(named: "Unlocked")
            self.isUserInteractionEnabled = false
            sendActions(for: [.touchUpOutside, .valueChanged])
        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                self.sliderButton.frame = CGRect(x: self.bounds.minX + 10, y: self.bounds.maxY - 39, width: 30, height: 30)
            }, completion: nil)
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
