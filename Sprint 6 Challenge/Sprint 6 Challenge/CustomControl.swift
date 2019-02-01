//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Jocelyn Stuart on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    
    var isLocked: Bool = true
    
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    
    var imageView: UIImageView = UIImageView()
    var trackView: UIView = UIView()
    
    var ballLabel: UILabel = UILabel()
    
    var count: Int = 0
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        
        trackView.backgroundColor = UIColor.gray
        trackView.frame = CGRect(x: 0, y: 192, width: 236, height: 40)
        trackView.layer.cornerRadius = 20
        self.addSubview(trackView)
        
        self.layer.cornerRadius = 30
        
        ballLabel.frame = CGRect(x: 0.0, y: 192, width: 40 , height: 40)
        ballLabel.textAlignment = .center
        ballLabel.text = "●"
        ballLabel.font = UIFont.boldSystemFont(ofSize: 40)
        self.addSubview(ballLabel)
        
        if isLocked == true {
            imageView = UIImageView(image: lockedImage)
            imageView.frame = CGRect(x: 75, y: 50, width: 100, height: 100)
            //imageView.center = self.center
            self.addSubview(imageView)
        } else {
            imageView = UIImageView(image: unlockedImage)
            imageView.frame = CGRect(x: 75, y: 50, width: 100, height: 100)
            //imageView.center = self.center
            self.addSubview(imageView)
        }
    
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        count += 1
        // color = what the color is supposed to be based onthe touch point's location
       // isLocked = self.lockControl(for: touchPoint)
        
         UIView.animate(withDuration: 0) {
            if touchPoint.x >= 190 {
                self.ballLabel.frame.origin.x = 190
                self.isLocked = self.lockControl(for: touchPoint)
                print(touchPoint.x)
                print(self.isLocked)
                self.sendActions(for: [.touchDown, .valueChanged])
            } else {
                self.ballLabel.frame.origin.x = touchPoint.x
                print(touchPoint.x)
                print(self.isLocked)
                self.sendActions(for: [.touchDown, .valueChanged])
            }
        }
        
        //print("Begin tracking touches")
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        //print("Continue tracking touches")
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            // color = what the color is supposed to be based on the touch point's location
         
           // isLocked = self.lockControl(for: touchPoint)
            
            
            UIView.animate(withDuration: 0) {
                if touchPoint.x >= 190 {
                    self.ballLabel.frame.origin.x = 190
                    self.isLocked = self.lockControl(for: touchPoint)
                    print(touchPoint.x)
                    print(self.isLocked)
                    self.sendActions(for: [.valueChanged, .touchDragInside])
                } else {
                    self.ballLabel.frame.origin.x = touchPoint.x
                    print(touchPoint.x)
                    print(self.isLocked)
                    self.sendActions(for: [.valueChanged, .touchDragInside])
                }
            }
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) } //everything inside the brackets will get executed before the function ends
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            // color = what the color is supposed to be based on the touch point's location
            isLocked = self.lockControl(for: touchPoint)
            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        print("Touch tracking ended")
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        print("Touch tracking cancelled")
    }
    
    
    
    private func lockControl(for location: CGPoint) -> Bool {
        if location.x >= 190 {
            return false
        } else {
            return true
        }
        
    }
    
    
    
}

