import UIKit

enum Appearance {
    
    static var seaGreen = UIColor(named: "seagreen")
    static var peach = UIColor(named: "peach")
    
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = seaGreen
        
        UIBarButtonItem.appearance().tintColor = peach
    }
}
