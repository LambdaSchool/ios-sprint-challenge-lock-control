//
//import UIKit
//
//@IBDesignable class CustomControlTrack: CALayer {
//    
//    weak var customControl: CustomControl?
//    
//    // Implement a draw function
//    override func draw(in ctx: CGContext) {
//        
//        // Make sure we have a custom control/slider
//        guard let slider = customControl else { return }
//        
//        // If there is one, get a path that is a bounds with a corner radius of the track itself
//        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        
//        // Add a path to a context, so let the context know it's a path we will deal with
//        ctx.addPath(path.cgPath)
//        
//        // Set fill color
//        ctx.setFillColor(slider.trackColor.cgColor)
//        // Fill it
//        ctx.fillPath()
//        
//        // Change the fill color
//        ctx.setFillColor(slider.trackTintColor.cgColor)
//        
//        // Make a rectangle
//        // Get the width by subtracting the lower position from the upper position
//        let lowerValuePosition = slider.position(for: slider.minimumValue)
//        let upperValuePosition = slider.position(for: slider.maximumValue)
//        let width = upperValuePosition - lowerValuePosition
//        
//        // Make the rectangle
//        let rect = CGRect(x: lowerValuePosition, y: 0, width: width, height: bounds.height)
//        
//        // Tell the context to fill the rectangle
//        ctx.fill(rect)
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//}
