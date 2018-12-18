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
        ball.frame = CGRect(x: 2, y: 4, width: 40, height: 40)
        ball.backgroundColor = Appearance.michiganBlue
        ball.layer.borderWidth = 2.2
        ball.layer.cornerRadius = ballFrame.bounds.height / 2.5
        ball.isUserInteractionEnabled = true //true
        ballFrame.addSubview(ball)
        
        // ball frame
        ballFrame.frame = CGRect(x: 5, y: 160, width: self.bounds.width - 10, height: self.bounds.height - 170)
        ballFrame.backgroundColor = Appearance.michiganMaize
        ballFrame.layer.borderWidth = 1
        ballFrame.layer.borderColor = UIColor.blue.cgColor
        ballFrame.layer.cornerRadius = self.bounds.height / 32
        addSubview(ballFrame)
        ballFrame.isUserInteractionEnabled = false
        
        // image layer(lock),
        lockImage.image = UIImage(named: "Locked")
        lockImage.frame = CGRect(x: 60, y: 40, width: self.bounds.width / 2.0, height: self.bounds.height / 3 )
        lockImage.contentMode = .scaleAspectFill
        addSubview(lockImage)
       
    }
    
   
    private func calucuatePercent(with touchPoint: CGPoint) {
        // start position
        // end position
        // distance btw two points
        // calculate percentage from within the width of ball frame.
        
        let ballFrameWidth = ballFrame.bounds.width
        let startPosition = ball.frame.width
        let endPosition = ballFrameWidth - 5
        
        let distance = startPosition - touchPoint.x
        let percentCalc = Double(distance / (endPosition - startPosition))
        
        
        
        
    }
    
    
    // MARK: - UI Control
   
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: ballFrame)
        if ballFrame.bounds.contains(touchPoint) {
            print(touchPoint)
            ball.frame = CGRect(x: touchPoint.x - 20, y: ball.frame.origin.y, width: 40, height: 40)        }
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: ballFrame)
        if ballFrame.bounds.contains(touchPoint){
            sendActions(for: [.touchDragInside, .valueChanged])
            print(touchPoint)
            ball.frame = CGRect(x: touchPoint.x - 20, y: ball.frame.origin.y, width: 40, height: 40)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event)}
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: ballFrame)
        
        if bounds.contains(touchPoint) {
            ball.frame = CGRect(x: 5 , y: ball.frame.origin.y, width: 40, height: 40)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            ball.frame = CGRect(x: ballFrame.frame.width - 42, y: ball.frame.origin.y, width: 40, height: 40) //??
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    
    
    
    
    // MARK: - Properties
    var lockImage = UIImageView()
    var ball = UIView()
    var ballFrame = UIView()

    
    
    
}
