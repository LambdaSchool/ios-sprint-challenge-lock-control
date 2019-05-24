//
//  LockControl.swift
//  Sprint 4 Challenge
//
//  Created by Jonathan Ferrer on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LockControl: UIControl {

    func setupImage() {

        lockImage = UIImageView()
        lockImage.translatesAutoresizingMaskIntoConstraints = false
        lockImage.image = UIImage(named: "Locked")
        lockImage.contentMode = .scaleAspectFit
        addSubview(lockImage)
        let widthConstraint = NSLayoutConstraint(item: lockImage!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        let heightConstraint = NSLayoutConstraint(item: lockImage!, attribute: .height, relatedBy: .equal, toItem: lockImage, attribute: .width, multiplier: 1, constant: 0)
        let centerXConstraint = NSLayoutConstraint(item: lockImage!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: lockImage!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -30)
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, centerXConstraint, centerYConstraint])
    }

    func unlock() {

        isLocked = false
        sendActions(for: .primaryActionTriggered)
        UIView.animate(withDuration: 1) {
            self.thumb.frame.origin = CGPoint(x: self.bounds.width - 160, y: self.currentButtonPosition)
            self.lockImage.image = UIImage(named: "Unlocked")
            self.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)

        }
    }

    func resetLock() {

        isLocked = true
        sendActions(for: .primaryActionTriggered)

        UIView.animate(withDuration: 1) {
            self.thumb.frame.origin = CGPoint(x: 25, y: self.currentButtonPosition)
            self.lockImage.image = UIImage(named: "Locked")
            self.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
    }

    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 50
        layer.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
    }

    func setupSliderTrack() {

        let buttonView = UIView()
        buttonView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        buttonView.isUserInteractionEnabled = false
        buttonView.frame = CGRect(x: 20, y: currentButtonPosition - 5, width: self.bounds.width - 40, height: thumbSize + 10)
        buttonView.layer.cornerRadius = buttonView.frame.height / 2
        self.addSubview(buttonView)
    }

    func setupThumb() {

        thumb = UIView()
        thumb.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        thumb.isUserInteractionEnabled = false
        thumb.frame = CGRect(x: 25, y: currentButtonPosition, width: thumbSize, height: thumbSize)
        thumb.layer.cornerRadius = thumb.frame.width / 2
        self.addSubview(thumb)
    }



    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        guard isLocked else { return false }
        let touchPoint = touch.location(in: self)
        if thumb.frame.contains(touchPoint) {
            sendActions(for: .touchDown)
            return true
        } else {
            return false
        }
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        guard touchPoint.x > 15 && touchPoint.x < bounds.width - thumb.frame.width - 15 else { return true }
        thumb.frame.origin = CGPoint(x: touchPoint.x, y: currentButtonPosition)
        sendActions(for: .touchDragInside)
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {

        defer { super.endTracking(touch, with: event) }
        guard let touchPoint = touch?.location(in: self) else {
            sendActions(for: .touchUpOutside)
            return
        }
        sendActions(for: .touchUpInside)
        if touchPoint.x >= (0.80 * (bounds.width - thumb.frame.width)) {
            unlock()
        } else {
            resetLock()
        }
    }

    override func cancelTracking(with event: UIEvent?) {

        super.cancelTracking(with: event)
        sendActions(for: .touchCancel)
        resetLock()
    }

// Properties

    var lockImage: UIImageView!
    var thumb: UIView!
    var thumbSize: CGFloat = 40
    var currentButtonPosition: CGFloat {
        return self.bounds.height - 80
    }
    var isLocked = true


}
