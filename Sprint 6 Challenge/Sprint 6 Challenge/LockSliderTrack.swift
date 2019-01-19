import UIKit

class LockSliderTrack: CALayer {
    weak var lockSlider: LockSlider?
    
    override func draw(in ctx: CGContext) {
        guard let slider = lockSlider else { return }
        
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        ctx.addPath(path.cgPath)
        
        ctx.setFillColor(slider.trackColor.cgColor)
        ctx.fillPath()
        
        ctx.setFillColor(slider.customTintColor)
        let lowerValuePosition = slider.position(for: slider.minimumValue)
        let upperValuePosition = slider.position(for: slider.maximumValue)
        let width = upperValuePosition - lowerValuePosition
        let rect = CGRect(x: lowerValuePosition, y: 0, width: width, height: bounds.height)
        ctx.fill(rect)
        
    }
    
}
