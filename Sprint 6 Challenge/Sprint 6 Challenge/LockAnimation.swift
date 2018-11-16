//
//  LockAnimation.swift
//  Sprint 6 Challenge
//
//  Created by Nikita Thomas on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class LockAnimation: UIControl {
    
    var isUnlocked = false
    var imageView: UIImageView!
    var barView: UIView!
    var block: UIView!
    
    let lockedImage = UIImage(named: "Locked")
    let unlockedImage = UIImage(named: "Unlocked")
    
    var viewController = ViewController()
    
    func reset() {
        imageView.image = lockedImage
        moveBlock(to: 0)
        isUnlocked = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor.orange
        layer.cornerRadius = 30
        
        // lock
        imageView = UIImageView(frame: CGRect(x: 60, y: 46, width: 120, height: 120))
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = lockedImage
        
        // sliding bar
        barView = UIView(frame: CGRect(x: 8, y: 184, width: 228, height: 50))
        addSubview(barView)
        barView.backgroundColor = #colorLiteral(red: 1, green: 0.6733359602, blue: 0.2927009187, alpha: 1)
        barView.layer.cornerRadius = barView.bounds.height / 2
        barView.isUserInteractionEnabled = false
        
        // block view
        block = UIView(frame: blockFrame(offset: 0))
        barView.addSubview(block)
        block.backgroundColor = .black
        block.layer.cornerRadius = block.bounds.height/2
        block.layer.borderColor = UIColor.red.cgColor
        block.layer.borderWidth = 2
        block.isUserInteractionEnabled = false
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: block)
        if block.bounds.contains(touchPoint) {
            sendActions(for: .touchDown)
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: barView)
        if barView.bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        
        let perc = findPercentage(with: touchPoint)
        let offset = (perc * 178) + 8
        block.frame = blockFrame(offset: offset)
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch, !isUnlocked else { return }
        
        let touchPoint = touch.location(in: barView)
        let perc = findPercentage(with: touchPoint)
        
        print("perc: \(perc)")
        
        if perc > 0.8 {
            isUnlocked = true
            imageView.image = unlockedImage
            sendActions(for: .valueChanged)
            if block.frame.origin.x != 184 {
                moveBlock(to: 184)
            }
        } else {
            reset()
        }
    }

    
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        reset()
    }
    
    func findPercentage(with point: CGPoint) -> CGFloat {
        var perc = point.x / barView.bounds.width
        if perc > 1.0 {
            perc = 1.0
        } else if perc < 0.0 {
            perc = 0.0
        }
        return perc
    }
    
    func blockFrame(offset: CGFloat) -> CGRect {
        return CGRect(x: offset, y: 0, width: 50, height: 50)
    }
    
    func moveBlock(to point: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.block.frame = self.blockFrame(offset: point)
        }
    }
    
    
    
    
}
