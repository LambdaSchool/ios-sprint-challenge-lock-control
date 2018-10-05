//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Moin Uddin on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit


class LockControl: UIControl {
    
    var sliderView: UIView!
    var dotView: UIView!
    var currentImageView: UIImageView!
    let lockedImage = UIImage(named: "Locked")!
    let unlockedImage = UIImage(named: "Unlocked")!
    var unlocked: Bool = false
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = 20
        clipsToBounds = true
        setupSlider()
        setupDotView()
        setupImageView()
    }
    
    func setupSlider() {
        let sliderFrame = CGRect(x: 0, y: self.bounds.height * 0.80, width: self.bounds.width, height: 40)
        sliderView = UIView(frame: sliderFrame)
        sliderView.isUserInteractionEnabled = true
        sliderView.clipsToBounds = true
        sliderView.layer.cornerRadius = 20
        sliderView.backgroundColor = UIColor.darkGray
        self.addSubview(sliderView)
        //setupsliderViewContraints(sliderView: sliderView)
    }
    
    func setupDotView() {
        dotView = UIView(frame: CGRect(x: 0, y: 0, width: 40.0, height: 35.0))
        dotView.backgroundColor = UIColor.lightGray
        dotView.isUserInteractionEnabled = true
        dotView.clipsToBounds = true
        dotView.layer.cornerRadius = dotView.frame.size.width / 2
        sliderView.addSubview(dotView)
        
    }
    func setupImageView() {
        let imageFrame = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: self.bounds.height / 2)
        currentImageView = UIImageView(frame: imageFrame)
        currentImageView?.image = lockedImage
        self.addSubview(currentImageView)
        setupImageViewContraints(imageView: currentImageView)
        
    }
    
    
    //It only works if you drag from top of the superView
    // Works but not how I want to it work
    //Still can't drag on dot
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if sliderView.bounds.contains(touchPoint) {
            print("begins tracking")
            update(at: touch)
            sendActions(for: [.touchDown])
        } else {
            print(touchPoint)
            print("not in the slider")
            return false
        }
        return true
    }
    
    //reset backend functionality works
    func reset() {
        UIView.animate(withDuration: 0.5) {
            self.dotView.frame.origin.x = 0
        }
        currentImageView.image = lockedImage
        unlocked = false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if sliderView.bounds.contains(touchPoint) {
            print("continue tracking")
            update(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    private func update(at touch: UITouch) {
         let touchPoint = touch.location(in: self)
         dotView.center.x = touchPoint.x
        if dotView.center.x > sliderView.bounds.width*0.80 {
            currentImageView.image = unlockedImage
            unlocked = true
            sendActions(for: [.valueChanged])
        } else {
            currentImageView.image = lockedImage
            unlocked = false
            sendActions(for: [.valueChanged])
        }
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touchPoint = touch?.location(in: dotView),
            let touch = touch else { return }
        if dotView.center.x < sliderView.bounds.width*0.80 {
            dotView.frame.origin.x = 0
            reset()
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func setupImageViewContraints(imageView: UIView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageCenterYConstraint = NSLayoutConstraint(
                    item: imageView,
                    attribute: .centerY,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .centerY,
                    multiplier: 1,
                    constant: 0)
        
        let imageCenterXConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)

        
        NSLayoutConstraint.activate([imageCenterXConstraint, imageCenterYConstraint])
    }
    
    func setupsliderViewContraints(sliderView: UIView) {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        let sliderBottomConstraint = NSLayoutConstraint(
            item: sliderView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self.safeAreaLayoutGuide,
            attribute: .bottom,
            multiplier: 1,
            constant: 20)
        
        let sliderWidthConstraint = NSLayoutConstraint(
            item: sliderView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 100)
        
        let sliderHeightConstraint = NSLayoutConstraint(
            item: sliderView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 100)
        
        
        NSLayoutConstraint.activate([sliderBottomConstraint, sliderHeightConstraint, sliderWidthConstraint])
    }
}
