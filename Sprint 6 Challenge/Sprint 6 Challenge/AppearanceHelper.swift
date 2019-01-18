// 2/3rds complete.
// Maybe I will change the color of the bar button item (barb) in the IB.


import UIKit

struct AppearanceHelper {
    
    static func setCustomAppearance() {
        
        // navbar background color
        UINavigationBar.appearance().barTintColor = .red
        
        //TODO: Check bar button item 'text' color
        // Set to blue on purpose
        UIBarButtonItem.appearance().tintColor = .blue

        // navbar text color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}
