//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Julian A. Fordyce on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBall(ballView)
        updateFrames()
    }
    
    
    private func setupBall(_ ball: UIView) {
        
        
    }
    
    func position(for value: CGFloat) -> CGRect {
        
        
    }
    
    
    
    private func ballFrame(for vlaue:CGFloat) -> CGRect {
        
    }
    
    private func updateFrames() {
    
    
    }
    
    func reset() {
        
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
