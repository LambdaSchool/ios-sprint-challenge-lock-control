import UIKit

class CustomControl: UIControl {
    
    //MARK: - Properties
    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 1
    var thumbValue: CGFloat = 0
    
    let thumb = UIView()
    var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    var pLocation = CGPoint()
    var isUnlocked: Bool = false
    
    //thumb set up
    private func setupThumb(_ thumb: UIView) {
        let thumbFrame = CGRect(x: 0, y: 0, width: thumbWidth, height: thumbWidth)
        thumb.frame = thumbFrame
        thumb.backgroundColor = .cheetos
        thumb.layer.cornerRadius = thumbWidth/2
        thumb.isUserInteractionEnabled = false
        
        addSubview(thumb)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return(bounds.width - thumbWidth - 12) * value
    }
    
    private func thumbFrame(for value: CGFloat) -> CGRect {
        let x = position(for: value) + 6
        let y = (bounds.height - thumbWidth)/2
        return CGRect(x: x, y: y, width: thumbWidth, height: thumbWidth)
    }
    
    private func updateControlFrames() {
        thumb.frame = thumbFrame(for: thumbValue)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupThumb(thumb)
        updateControlFrames()
    }
    
    func reset() {
        thumbValue = 0.0
        updateControlFrames()
        isUnlocked = false
        self.isUserInteractionEnabled = true
    }
}
