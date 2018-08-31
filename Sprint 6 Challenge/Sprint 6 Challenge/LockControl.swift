//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Andrew Liao on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable class LockControl: UIControl {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    //MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        guard let lockBarBounds = lockBarBounds,
            let lockBarActivateBounds = lockBarActivateBounds,
            let lockBarBolt = lockBarBolt else {return true}
        
        if lockBarBounds.contains(touchPoint){
            lockBarBolt.frame.origin = touchPoint
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch,
         let lockBarActivateBounds = lockBarActivateBounds else {return}
        let touchPoint = touch.location(in: self)
        if lockBarActivateBounds.contains(touchPoint){
            updateValue(at: touch)
        }
    }
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    func moveBolt(at touch: UITouch){
        
    }
    func updateValue(at touch: UITouch){
        imageView?.image = unlockedImage
        isLocked = false
        sendActions(for: [.valueChanged])
    }
    
    func reset(){
        imageView?.image = lockedImage
        isLocked = true
    }
    
    //MARK: - Build Control View
    func setup(){
        
        clipsToBounds = true
        layer.cornerRadius = 16
        layer.backgroundColor = Appearance.lightSteelBlue.cgColor
        
        createImageView()
        createLockBar()
        
//        let dummy = UIView(frame: lockBarBounds!)
//        let dummy2 = UIView(frame:lockBarActivateBounds!)
//        dummy.layer.backgroundColor = UIColor.red.cgColor
//        dummy2.layer.backgroundColor = UIColor.purple.cgColor
//        addSubview(dummy)
//        addSubview(dummy2)
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
        self.imageView = imageView
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

        lockBarActivateBounds = activateBounds
        lockBarBounds = self.convert(lockBar.bounds, from: lockBar)
        
    }
    
    // MARK: - Properties
    private(set) var isLocked: Bool = true
    
    private var imageView: UIImageView?
    private var lockBarBolt: UIView?
    private var lockBarBounds: CGRect?
    private var lockBarActivateBounds: CGRect?
    private let lockedImage = UIImage(named: "Locked")!
    private let unlockedImage = UIImage(named: "Unlocked")!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
