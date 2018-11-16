import UIKit

enum Appearance {
    
    static var red = UIColor(red: 150.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
    
    static func setup() {
        UINavigationBar.appearance().barTintColor = red
        
        let attr = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = attr
        UINavigationBar.appearance().largeTitleTextAttributes = attr
    }
    
}
