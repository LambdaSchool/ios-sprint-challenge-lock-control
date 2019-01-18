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
    let sliderValuePosition = slider.position(for: slider.sliderValue)
    let width = sliderValuePosition
    let rect = CGRect(x: sliderValuePosition, y: 0, width: width, height: bounds.height)
    
    ctx.fill(rect)
    }
}
