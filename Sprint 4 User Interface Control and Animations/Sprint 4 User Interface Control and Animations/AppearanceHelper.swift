import UIKit

struct AppearanceHelper {
    
    static func setCustomAppearance() {
        
        UINavigationBar.appearance().barTintColor = .red
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}
