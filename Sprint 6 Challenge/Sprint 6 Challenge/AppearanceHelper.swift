import UIKit

enum AppearanceHelper {
    
    static var lipstickRed = UIColor(displayP3Red: 0.297, green: 0.0, blue: 0.0, alpha: 1.0)
    
    static func setDarkAppearance() {
        UINavigationBar.appearance().barTintColor = lipstickRed
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes as [NSAttributedStringKey: Any]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.black,], for: .normal)
    }
}
