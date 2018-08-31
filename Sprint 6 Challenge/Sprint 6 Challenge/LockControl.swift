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
        
        
    }
    
    //Properties
    var isLocked: Bool = true
    private let lockedImage = UIImage(named: "Locked")
    private let unlockedImage = UIImage(named: "Unlocked")
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
