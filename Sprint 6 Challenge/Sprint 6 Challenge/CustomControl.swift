//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Julian A. Fordyce on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBall(ballView)
        updateFrames()
    }
    
    private func setupBall(_ ball: UIView) {
        let ballFrame = CGRect(x: 0, y: 0, width: ballWidth, height: ballWidth)
        ball.frame = ballFrame
        ball.backgroundColor = .black
        ball.layer.cornerRadius = ballWidth / 2
        
        addSubview(ball)
        
        ball.isUserInteractionEnabled = false
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return (bounds.width - ballWidth - 10) * value
    }
    
    private func ballFrame(for value:CGFloat) -> CGRect {
        let x = position(for: value) + 6
        let y = (bounds.height - ballWidth) / 2
        return CGRect(x: x, y: y, width: ballWidth, height: ballWidth)
    }
    
    private func updateFrames() {
        ballView.frame = ballFrame(for: ballValue)
    }
    
    func reset() {
        ballValue = 0.0
        isUnlocked = false
        updateFrames()
        
        self.isUserInteractionEnabled = true
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        <#code#>
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        <#code#>
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        <#code#>
    }
    
    override func cancelTracking(with event: UIEvent?) {
        <#code#>
    }
    
        // MARK: - Properties
        var minimumValue: CGFloat = 0
        var maximumValue: CGFloat = 1
        var ballValue: CGFloat = 0.0
        var isUnlocked: Bool = false
        
        private var ballView = UIView()
        private var previousLocation = CGPoint()
        
        private var ballWidth: CGFloat {
            return frame.height * 0.825
        }
    
    
    
}
