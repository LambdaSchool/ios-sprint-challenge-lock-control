//
//  SlideLocker.swift
//  Sprint 6 Challenge
//
//  Created by Simon Elhoej Steinmejer on 31/08/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockSlider: UIControl
{
    private(set) var isLocked = false
    
    public var dotColor: UIColor?
    {
        didSet
        {
            dot.backgroundColor = dotColor
        }
    }
    
    public var allowDraggingOutside: Bool = true
    
    lazy var dot: UIView =
        {
            let size = self.frame.height - 4
            let view = UIView(frame: CGRect(x: 2, y: 2, width: size, height: size))
            view.backgroundColor = .black
            view.layer.cornerRadius = view.bounds.width / 2
            view.isUserInteractionEnabled = false
            
            return view
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        
        addSubview(dot)
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
    {
        updateDotLocation(touchPoint: touch.location(in: self))
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
    {
        let touchPoint = touch.location(in: self)
        
        if dot.frame.contains(touchPoint)
        {
            updateDotLocation(touchPoint: touchPoint)
            sendActions(for: [.touchDragInside])
        }
        else if allowDraggingOutside
        {
            updateDotLocation(touchPoint: touchPoint)
            sendActions(for: [.touchDragOutside])
        }
        else
        {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?)
    {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        checkDotPosition(touchPoint: touchPoint)
    }
    
    override func cancelTracking(with event: UIEvent?)
    {
        sendActions(for: [.touchCancel])
    }
    
    private func updateDotLocation(touchPoint: CGPoint)
    {
        if touchPoint.x < 2 + (dot.bounds.width / 2)
        {
            return
        }
        else if touchPoint.x > (self.bounds.maxX - 2) - (dot.bounds.width / 2)
        {
            return
        }
        else
        {
            dot.center.x = touchPoint.x
        }
    }
    
    private func checkDotPosition(touchPoint: CGPoint)
    {
        let startX = self.bounds.minX
        let endX = self.bounds.maxX
        
        let percentage = (touchPoint.x - startX) / (endX - startX)
        
        if percentage < 0.8
        {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                
                self.dot.center.x = 2 + (self.dot.bounds.width / 2)
                
            }, completion: nil)
        }
        else
        {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                
                self.dot.center.x = (self.bounds.maxX - 2) - (self.dot.bounds.width / 2)
                
            }) { (completed) in
                
                self.isLocked = false
                self.isUserInteractionEnabled = false
                self.sendActions(for: [.valueChanged])
            }
        }
    }
    
    func reset()
    {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            
            self.dot.center.x = 2 + (self.dot.bounds.width / 2)
            
        }, completion: nil)
        
        self.isUserInteractionEnabled = true
        self.isLocked = true
        sendActions(for: [.valueChanged])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



















