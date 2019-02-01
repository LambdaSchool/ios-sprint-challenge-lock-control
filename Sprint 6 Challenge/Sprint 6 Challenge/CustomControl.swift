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
    
    var trackView: UIView = UIView()
    
    //var ballLabel: UILabel
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        
        trackView.backgroundColor = UIColor.gray
        trackView.frame = CGRect(x: 0, y: 192, width: 238, height: 40)
        trackView.layer.cornerRadius = 20
        self.addSubview(trackView)
        
        self.layer.cornerRadius = 30
        
        var ballLabel = UILabel(frame: CGRect(x: 0.0, y: 192, width: 40 , height: 40 ))
        ballLabel.textAlignment = .center
        ballLabel.text = "●"
        ballLabel.font = UIFont.boldSystemFont(ofSize: 40)
        self.addSubview(ballLabel)
        
        if isLocked == true {
            let imageView = UIImageView(image: lockedImage)
            imageView.frame = CGRect(x: 75, y: 50, width: 100, height: 100)
            //imageView.center = self.center
            self.addSubview(imageView)
        } else {
            let imageView = UIImageView(image: unlockedImage)
            imageView.frame = CGRect(x: 75, y: 50, width: 100, height: 100)
            //imageView.center = self.center
            self.addSubview(imageView)
        }
    
        
    }
    
    
    
    
    
    
    
    
    
    
    
}

