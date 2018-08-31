//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Andrew Liao on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    //MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if lockBarBounds.contains(touchPoint){
            sendActions(for: [.touchDragInside])
            if lockBarActivateBounds.contains(touchPoint){
                updateValue(at: touch)
            }
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {

        
    }
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch){
        
    }
    
    
    //MARK: - Build Control View
    func setup(){
        
        clipsToBounds = true
        layer.cornerRadius = 16
        layer.backgroundColor = Appearance.lightSteelBlue.cgColor
        
        createImageView()
        createLockBar()
    }
    
    func createImageView(){
        let width = self.frame.width/2
        let x = width/2
        let y = width/2
        
        let frame = CGRect(x: x, y: y, width: width, height: width)
        let imageView = UIImageView(frame: frame)
        imageView.contentMode = .scaleAspectFit
        imageView.image = lockedImage
        
        addSubview(imageView)
    }
    
    func createLockBar(){
        //create Bar
        let width = self.frame.width - 16*2
        let height = self.frame.height/6
        let y = self.frame.height - height - 10
        
        let lockFrame = CGRect(x: 16, y: y, width: width, height: height)
        let lockBar = UIView(frame: lockFrame)
        lockBar.layer.backgroundColor = UIColor.white.cgColor
        lockBar.clipsToBounds = true
        lockBar.layer.cornerRadius = height/2
        addSubview(lockBar)
        
        //create bolt of lock bar
        
        let radius = lockBar.frame.height - 6
        let boltFrame = CGRect(x: 5, y: 5/2, width: radius, height: radius)
        let bolt = UIView(frame: boltFrame)
        bolt.clipsToBounds = true
        bolt.layer.cornerRadius = radius/2
        bolt.layer.backgroundColor = Appearance.midnightBlue.cgColor
        lockBar.addSubview(bolt)
        
        //for use in touch handling
        let lockBarWidth = lockBar.frame.width
        let activateBounds = CGRect(x: lockBar.frame.origin.x + lockBarWidth/5*4,
                                    y: lockBar.frame.origin.y,
                                    width: lockBarWidth/5,
                                    height: lockBar.frame.height)

//        lockBarActivateBounds = self.convert(lockBar.bounds, from: lockBar)
        lockBarActivateBounds = activateBounds
        lockBarBounds = lockBar.bounds
        
    }
    
    // MARK: - Properties
    var isLocked: Bool = true
    
    private var lockBarBounds: CGRect!
    private var lockBarActivateBounds: CGRect!
    private let lockedImage = UIImage(named: "Locked")
    private let unlockedImage = UIImage(named: "Unlocked")
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
