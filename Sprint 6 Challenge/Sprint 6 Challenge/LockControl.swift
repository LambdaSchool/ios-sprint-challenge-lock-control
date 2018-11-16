//
//  LockControl.swift
//  Sprint 6 Challenge
//
//  Created by Jerrick Warren on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

 class LockControl: UIControl {
    
    // iniitializers
    // set up func
    // tracking funcitons
    // animation of lock and little slider thingy
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupControl()
    }
    
    
    var lockImage = UIImageView()
    var ball = UIView()
    var ballFrame = UIView()
    
    private func setupControl() {
        // make each item a layer , like in photoshop
        
        // ball layer (use corner radius to make round
        ball.frame = CGRect(x: 0, y: 0, width: ballFrame.bounds.width , height: ballFrame.bounds.height )
        ball.backgroundColor = Appearance.michiganBlue
        ball.layer.cornerRadius = self.bounds.height / 4
        
        ballFrame.addSubview(ball)
        
        // ball frame
        ballFrame.frame = CGRect(x: 5, y: 160, width: self.bounds.width - 10, height: self.bounds.height - 170)
        ballFrame.backgroundColor = Appearance.michiganMaize
        ballFrame.layer.cornerRadius = self.bounds.height / 32
        
        addSubview(ballFrame)
        
        // image layer(lock),
        lockImage.image = UIImage(named: "Locked")
        lockImage.frame = CGRect(x: 0, y: 0 , width: self.bounds.width / 2, height: self.bounds.height / 2 )
        lockImage.contentMode = .scaleAspectFit
        addSubview(lockImage)
       
        
    }
    
    
    // MARK: - UI Control
    
    
   
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: ballFrame)
        if bounds.contains(touchPoint) {
            print(touchPoint)
           
        }
        
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
            
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event)}
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    
    
    
}
