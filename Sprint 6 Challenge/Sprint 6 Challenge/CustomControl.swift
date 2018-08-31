//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Vuk Radosavljevic on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    
    // MARK: - Properties
    var value = 1
    private var componentDimension: CGFloat = 50.0
    private var componentCount = 5
    private var componentActiveColor = UIColor.black
    private var componentInactiveColor = UIColor.gray
    
    var squares = [UILabel]()
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
//        let square1 = UILabel(frame: CGRect(x: 8, y: 0, width: componentDimension, height: componentDimension))
//        square1.text = "■"
//        square1.tag = 1
//        square1.font = square1.font.withSize(32)
//        square1.textColor = componentActiveColor
//        square1.textAlignment = .center
//        squares.append(square1)
//        let square2 = UILabel(frame: CGRect(x: componentDimension + 8.0, y: 0, width: componentDimension, height: componentDimension))
//        square2.text = "■"
//        square2.tag = 2
//        square2.font = square2.font.withSize(32)
//        square2.textColor = componentInactiveColor
//        square2.textAlignment = .center
//        squares.append(square2)
//        let square3 = UILabel(frame: CGRect(x: componentDimension * 2 + 8, y: 0, width: componentDimension, height: componentDimension))
//        square3.text = "■"
//        square3.tag = 3
//        square3.font = square3.font.withSize(32)
//        square3.textColor = componentInactiveColor
//        square3.textAlignment = .center
//        squares.append(square3)
//        let square4 = UILabel(frame: CGRect(x: componentDimension * 3 + 8, y: 0, width: componentDimension, height: componentDimension))
//        square4.text = "■"
//        square4.tag = 4
//        square4.font = square4.font.withSize(32)
//        square4.textColor = componentInactiveColor
//        square4.textAlignment = .center
//        squares.append(square4)
//        let square5 = UILabel(frame: CGRect(x: componentDimension * 4 + 8, y: 0, width: componentDimension, height: componentDimension))
//        square5.text = "■"
//        square5.tag = 5
//        square5.font = square5.font.withSize(32)
//        square5.textColor = componentInactiveColor
//        square5.textAlignment = .center
//        squares.append(square5)
//
//        self.addSubview(square1)
//        self.addSubview(square2)
//        self.addSubview(square3)
//        self.addSubview(square4)
//        self.addSubview(square5)
        
        
        let square1 = UILabel(frame: CGRect(x: 0, y: 0, width: componentDimension, height: componentDimension))
        square1.text = "▭▭▭▭▭▭▭"
        square1.tag = 1
        square1.font = square1.font.withSize(32)
        square1.textColor = componentInactiveColor
        square1.textAlignment = .center
        squares.append(square1)
        let square2 = UILabel(frame: CGRect(x: 50, y: 0, width: componentDimension, height: componentDimension))
        square2.text = "▭▭▭▭▭▭▭"
        square2.tag = 2
        square2.font = square2.font.withSize(32)
        square2.textColor = componentInactiveColor
        square2.textAlignment = .center
        squares.append(square2)
        let square3 = UILabel(frame: CGRect(x: 100, y: 0, width: componentDimension, height: componentDimension))
        square3.text = "▭▭▭▭▭▭▭"
        square3.tag = 3
        square3.font = square3.font.withSize(32)
        square3.textColor = componentInactiveColor
        square3.textAlignment = .center
        squares.append(square3)
        let square4 = UILabel(frame: CGRect(x: 150, y: 0, width: componentDimension, height: componentDimension))
        square4.text = "▭▭▭▭▭▭▭"
        square4.tag = 4
        square4.font = square4.font.withSize(32)
        square4.textColor = componentInactiveColor
        square4.textAlignment = .center
        squares.append(square4)
        let square5 = UILabel(frame: CGRect(x: 200, y: 0, width: componentDimension, height: componentDimension))
        square5.text = "▭▭▭▭▭▭▭"
        square5.tag = 5
        square5.font = square5.font.withSize(32)
        square5.textColor = componentInactiveColor
        square5.textAlignment = .center
        squares.append(square5)
        
        self.addSubview(square1)
        self.addSubview(square2)
        self.addSubview(square3)
        self.addSubview(square4)
        self.addSubview(square5)
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown, .valueChanged])
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        for squareLabel in squares {
            let touchPoint = touch.location(in: squareLabel)
            if self.bounds.contains(touchPoint) {
                value = squareLabel.tag
                squareLabel.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            } else {
                squareLabel.textColor = componentInactiveColor
            }
        }
    }
}
