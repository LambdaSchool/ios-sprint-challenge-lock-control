//
//  CustomControl.swift
//  Sprint 4 Challenge
//
//  Created by Mitchell Budge on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {

    var x = 0.0
    var minX: CGFloat = 0
    var maxX: CGFloat = 1
    var ballValue: CGFloat = 0.0
    
    private var ballView = UIView()
    private var previousLocation = CGPoint()
    private var ballWidth: CGFloat { return frame.height * 0.825 }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBall(ballView)
    }
    
    private func setupBall(_ ball: UIView) {
        let ballFrame = CGRect(x: 2, y: 4, width: ballWidth, height: ballWidth)
        ball.frame = ballFrame
        ball.backgroundColor = .black
        ball.layer.cornerRadius = ballWidth / 2
        addSubview(ball)
        ball.isUserInteractionEnabled = false
    }
    
    private func updateValue() {
        ballView.frame = ballFrame(for: ballValue)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return (bounds.width - ballWidth - 10) * value
    }
    
    private func ballFrame(for value:CGFloat) -> CGRect {
        let x = position(for: value) + 6
        let y = (bounds.height - ballWidth) / 2
        return CGRect(x: x, y: y, width: ballWidth, height: ballWidth)
    }
    
    func reset() {
        UIView.animate(withDuration: 1) {
            self.ballValue = 0
            self.updateValue()
            self.isUserInteractionEnabled = true
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        if ballView.frame.contains(previousLocation) {
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            return false
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        let locationChange = location.x - previousLocation.x
        let valueChange = (maxX - minX) * locationChange / bounds.width
        previousLocation = location
        ballValue = min(max((ballValue + valueChange), minX), maxX)
        updateValue()
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        previousLocation = touch.location(in: self)
        if ballValue >= 0.8 {
            ballValue = 1
            sendActions(for: [.touchUpInside, .valueChanged])
            UIView.animate(withDuration: 1) {
                self.ballView.frame = self.ballFrame(for: 1)
            }
        }
        updateValue()
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
}

