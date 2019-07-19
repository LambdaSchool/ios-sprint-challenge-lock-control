//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Kat Milton on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class LockControl: UIControl {
    
//    var x: CGFloat = 0
//    var minX: CGFloat = 0
//    var maxX: CGFloat = 100
    
    var imageView: UIImageView = UIImageView()
    var sliderCircle: UIView = UIView()
    var sliderView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 20
        
        // create stack view
        let stackView = UIStackView()
        self.addSubview(stackView)
        stackView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 40
        
        //stack view constraints.
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            stackView.topAnchor.constraint(equalTo: self.topAnchor)
            ])
        
        // imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        imageView.image = UIImage(named: "Locked")
        stackView.addArrangedSubview(imageView)
        
        // imageview constraint
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 150)
            ])
        
        // slider background view
        sliderView.backgroundColor = UIColor.darkGray
        sliderView.clipsToBounds = true
        sliderView.isUserInteractionEnabled = false
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.layer.cornerRadius = 18
        sliderView.layer.shadowColor = UIColor.darkGray.cgColor
        sliderView.layer.shadowOffset = .zero
        sliderView.layer.shadowRadius = 4
        sliderView.layer.shadowOpacity = 1
        stackView.addArrangedSubview(sliderView)
        
        // slider background view constraints
        NSLayoutConstraint.activate([
            sliderView.heightAnchor.constraint(equalToConstant: 40),
            sliderView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -10)
            ])
    
        // slider circle setup
        sliderCircle.translatesAutoresizingMaskIntoConstraints = false
        sliderCircle.isUserInteractionEnabled = false
        sliderCircle.backgroundColor = AppearanceHelper.blueColor
        sliderCircle.frame = CGRect(x: self.bounds.minX + 10, y: self.bounds.maxY - 39, width: 30, height: 30)
        sliderCircle.clipsToBounds = true
        sliderCircle.layer.cornerRadius = sliderCircle.frame.width / 2
        sliderCircle.layer.shadowColor = UIColor.darkGray.cgColor
        sliderCircle.layer.shadowOffset = .zero
        sliderCircle.layer.shadowRadius = 4
        sliderCircle.layer.shadowOpacity = 1
        self.addSubview(sliderCircle)
    }
    
    func resetSlider() {
        sliderCircle.frame = CGRect(x: self.bounds.minX + 10, y: self.bounds.maxY - sliderView.frame.height, width: 30, height: 30)
        imageView.image = UIImage(named: "Locked")
        self.isUserInteractionEnabled = true
    }
    
    func updateValue(at touch: UITouch) {
        let touchLocation = touch.location(in: self)
        let adjustedSliderBackgroundFrame = CGRect(x: sliderView.frame.minX + 4, y: sliderView.frame.minY , width: sliderView.frame.width - 37, height: sliderView.frame.height)
        
        if adjustedSliderBackgroundFrame.contains(touchLocation) {
            if touchLocation.x >= (sliderView.frame.maxX - 33) * 0.8 {
                imageView.image = UIImage(named: "Unlocked")
                self.isUserInteractionEnabled = false
                sendActions(for: [.touchUpOutside, .valueChanged])
            }
            sliderCircle.frame = CGRect(x: touchLocation.x, y: self.bounds.maxY - sliderView.frame.height, width: 30, height: 30)
        }
    }
    
}


extension LockControl {
    
    // MARK: - Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if sliderCircle.bounds.contains(touchPoint) {
            sendActions(for: [.touchDown])
        }
            return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if sliderView.frame.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
            return true
        } else {
            sendActions(for: [.touchDragOutside])
            return false
        }
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if touchPoint.x >= (sliderView.frame.maxX - 33) * 0.8 {
            imageView.image = UIImage(named: "Unlocked")
            self.isUserInteractionEnabled = false
            sendActions(for: [.touchUpOutside, .valueChanged])
        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                self.sliderCircle.frame = CGRect(x: self.bounds.minX + 10, y: self.bounds.maxY - 39, width: 30, height: 30)
            }, completion: nil)
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }

}

