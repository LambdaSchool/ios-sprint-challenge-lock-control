import UIKit

class RangeSliderTrack: CALayer {
    weak var rangeSlider: RangeSlider?
    
    override func draw(in ctx: CGContext) {
        guard let slider = rangeSlider else { return }
    
    let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    ctx.addPath(path.cgPath)
    
    ctx.setFillColor(slider.trackColor.cgColor)
    ctx.fillPath()
    
    ctx.setFillColor(slider.customTintColor.cgColor)
    let lowerValuePosition = slider.position(for: slider.lowerValue)
    let upperValuePosition = slider.position(for: slider.upperValue)
    let width = upperValuePosition + lowerValuePosition
    let rect = CGRect(x: lowerValuePosition, y: 0, width: width, height: bounds.height)
    
    ctx.fill(rect)
    }
}
