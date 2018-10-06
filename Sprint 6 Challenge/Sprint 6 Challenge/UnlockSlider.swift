//
//  UnlockSlider.swift
//  Sprint 6 Challenge
//
//  Created by Madison Waters on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class UnlockSlider: UIControl {

    var value: Int = 1
    let slider = UIView()
    let thumbSlider = UIView()

    lazy var imageName = "Locked"
    lazy var image = UIImage(named: imageName)
    lazy var imageView = UIImageView(image: image!)
    
    func createSlider() {
    
        addSubview(slider)
        slider.frame = CGRect(x: 25, y: 300, width: 300, height: 50)
        slider.backgroundColor = Appearance.lightGray
        addSubview(slider)
    }
    
    func createThumbSlider() {
        
        addSubview(thumbSlider)
        thumbSlider.frame = CGRect(x: 30, y: 305, width: 40, height: 40)
        thumbSlider.backgroundColor = Appearance.darkGray
        addSubview(thumbSlider)
    }
    
    func createImage() {
        
        imageView.frame = CGRect(x: 105, y: 70, width: 125, height: 175)
        addSubview(imageView)
        imageView.alpha = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        createSlider()
        createThumbSlider()
        createImage()
        
    }
    
    // Pan Gesture Recognizer?? //
    
    
    //


//MARK: - Required Methods for Custom Control

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)

        let slide = self.slide(for: touchPoint)

        self.slide = slide

        sendActions(for: [.touchDown, .valueChanged])
        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)

        if bounds.contains(touchPoint) {

            slide = self.slide(for: touchPoint)
            sendActions(for: [.touchDragInside, .valueChanged])

        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touchPoint = touch?.location(in: self) else { return }

        if bounds.contains(touchPoint) {

            slide = self.slide(for: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])

        } else {
            sendActions(for: [.touchUpOutside])
        }
    }

    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        super.cancelTracking(with: event)
    }
    
    private func slide(for location: CGPoint) -> CGPoint {
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let dy = location.y - center.y
        let dx = location.x - center.x
        
        let offset = CGSize(width: dx / center.x, height: dy / center.y)
        
        let location = CGPoint(x: dx, y: dy)
        
        return location
    }
    
    
}
