
import UIKit

@IBDesignable class CustomControlTrack: CALayer {
    
    weak var customControl: CustomControl?
    
    // Implement a draw function
    override func draw(in ctx: CGContext) {
        
        // Make sure we have a custom control/slider
        guard let slider = customControl else { return }
        
        // If there is one, get a path that is a bounds with a corner radius of the track itself
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        // Add a path to a context, so let the context know it's a path we will deal with
        ctx.addPath(path.cgPath)
        
        // Set fill color
        ctx.setFillColor(slider.trackColor.cgColor)
        // Fill it
        ctx.fillPath()
        
        
        
    }
    
    
    
    
}
