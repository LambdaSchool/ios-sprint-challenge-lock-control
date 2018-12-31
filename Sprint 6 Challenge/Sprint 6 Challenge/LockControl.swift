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
    // make a function that calculates the distance the ball moves in the slider(ball frame)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupControl()
    }
    
   // MARK: - Private func
    
    private func setupControl() {
        // make each item a layer , like in photoshop
        
        // ball layer (use corner radius to make round
        ball.isUserInteractionEnabled = true
        ball.frame = CGRect(x: 5, y: 5, width: ballFrame.frame.height - 17.5, height: ballFrame.frame.height - 17.5 )
        ball.backgroundColor = Appearance.michiganBlue
        ball.layer.borderWidth = 2.2
        ball.layer.cornerRadius = ballFrame.frame.height / 2.75
       
        ballFrame.addSubview(ball)
        
        // ball frame
        ballFrame.isUserInteractionEnabled = false
        ballFrame.frame = CGRect(x: 0, y: lockImage.bounds.height, width: self.bounds.width, height: self.bounds.height * 0.25)
        ballFrame.backgroundColor = Appearance.michiganMaize
        ballFrame.layer.borderWidth = 1
        ballFrame.layer.borderColor = UIColor.blue.cgColor
        ballFrame.layer.cornerRadius = self.bounds.height / 32
        addSubview(ballFrame)
        
        
        // image layer(lock),
        lockImage.image = UIImage(named: "Locked")
        lockImage.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height:  self.bounds.height * 0.75)
        lockImage.contentMode = .scaleAspectFit
        addSubview(lockImage)
       
    }
    
    private func calucuatePercent(with touchPoint: CGPoint) {
        // start position
        // end position
        // distance btw two points
        // calculate percentage from within the width of ball frame.
        
        let ballFrameWidth = ballFrame.bounds.width
        let startPosition = ball.frame.width + 5
        let endPosition = ballFrameWidth - 5
        let distance = startPosition - touchPoint.x
        let percentCalc = Double(distance / (endPosition - startPosition))
        percentComplete = abs(percentCalc)
        
    }
    
    
    // MARK: - UI Control
   
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: ballFrame)
        if bounds.contains(touchPoint) {
        }
//        if ballFrame.bounds.contains(touchPoint) {
//            print(touchPoint)
//            ball.frame = CGRect(x: touchPoint.x - 20, y: ball.frame.origin.y, width: ballFrame.frame.height - 17.5, height: ballFrame.frame.height - 17.5)        }
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: ballFrame)
        
        if ballFrame.bounds.contains(touchPoint){
            calucuatePercent(with: touchPoint)
            
            let ballFrameWidth = ballFrame.bounds.width
            let start = ball.frame.width + 5
            let end = ballFrameWidth - 5
            let x = Double(end - start) * percentComplete
            
            ball.frame = CGRect(x: CGFloat(x), y:ball.frame.origin.y, width: ball.frame.width, height: ball.frame.height)
            
            sendActions(for: [.touchDragInside, .valueChanged])
           
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        //defer { super.endTracking(touch, with: event)}
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: ballFrame)
        
        if bounds.contains(touchPoint) {
            calucuatePercent(with: touchPoint)
            if percentComplete < 0.8 {
                ball.frame = CGRect(x: 5, y: 5, width: ballFrame.frame.height - 17.5, height: ballFrame.frame.height - 17.5 )
            
//            ball.frame = CGRect(x: 5 , y: ball.frame.origin.y, width: 40, height: 40)
//            sendActions(for: [.touchUpInside, .valueChanged])
            
        } else {
            ball.frame = CGRect(x: ballFrame.bounds.width - ball.frame.width - 5 , y: 5, width: ballFrame.frame.height - 17.5, height: ballFrame.frame.height - 17.5)
            unlockImage()
            self.isUserInteractionEnabled = false
        }
        sendActions(for: [.touchUpOutside, .valueChanged])
    
        } else {
            ball.frame = CGRect (x: ballFrame.bounds.width - ball.frame.width - 5, y: 5, width: ballFrame.frame.height - 17.5, height: ballFrame.frame.height - 17.5)
            unlockImage()
            self.isUserInteractionEnabled = false
    }
        sendActions(for: .touchUpOutside)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        super.cancelTracking(with: event)
    }
    
    
    private func unlockImage() {
        lockImage.image = UIImage(named: "Unlocked")
    }
    
    // MARK: - Properties
    var lockImage = UIImageView()
    var ball = UIView()
    var ballFrame = UIView()
    var percentComplete: Double = 0.0

    
    
    
}
