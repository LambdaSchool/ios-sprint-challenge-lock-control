import UIKit

@IBDesignable class CustomControl: UIControl {
    var value: Int = 1
    
    // private constants
    private let componentDimension: CGFloat = 35
    private let componentCount = 10
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    // static variables
    var lockState: Bool = true
    static var lockStateImage: UIImage = UIImage(named: "Locked")!
    static var thresholdValue = 0

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
        changeImage()
        reset()
    }
    
    var labelArray: [UILabel] = []
    
    func setup() {
        
        // Set the starting point for the first star
        var xCoordinate: CGFloat = 1
        
        for position in 0 ... 9 {
            // create label and its frame as a square
            let star = UILabel(frame: CGRect(x: xCoordinate, y: 0.0, width: componentDimension, height: componentDimension))
            
            // update the coordinate of the next star
            xCoordinate += componentDimension
            
            // add each label as a subview
            addSubview(star)
            
            // store each label into a local array
            labelArray.append(star)
            
            // add a tag to each star
            star.tag = position
            // print("Star tag \(star.tag)")
            
            // Set the font (bold system font, size 32.0)
            star.font = UIFont.boldSystemFont(ofSize: 32.0)
            
            // Set the text (pick your favorite Unicode star from the character picker)
            // “✯” U+272F - http://xahlee.info/comp/unicode_stars.html
            star.text = "="
            
            // Set the alignment (center) for your label.
            star.textAlignment = .center
            
            // Every star but the first should be grayed out.
            if star.tag != 0 {
                star.textColor = componentInactiveColor
            } else {
                star.textColor = componentActiveColor
            }
            
            if value < 8 {
                CustomControl.lockStateImage = LockState.lockedImage
            } else if value >= 8 {
                CustomControl.lockStateImage = LockState.unlockedImage
            }
   
        }
    }
    
    // Tells Auto Layout how big the custom control should be
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        // Send .touchDragInside or .touchDragOutside
        // Call updateValue() if inside
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        // Change colors of the stars
        // Change the value of value
        for star in labelArray {
            let touchPoint = touch.location(in: star)
            if bounds.contains(touchPoint) {
                value = star.tag
                CustomControl.thresholdValue = value
                // print(value)
                star.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            } else {
                star.textColor = componentInactiveColor
                sendActions(for: .valueChanged)
            }
        }
    }
    
    func changeImage() {
        if value < 8 {
            CustomControl.lockStateImage = LockState.lockedImage
        } else if value >= 8 {
            CustomControl.lockStateImage = LockState.unlockedImage
        }
    }
    
    func reset() {
        for star in labelArray {
            star.textColor = componentInactiveColor
        }
    }
    
}
