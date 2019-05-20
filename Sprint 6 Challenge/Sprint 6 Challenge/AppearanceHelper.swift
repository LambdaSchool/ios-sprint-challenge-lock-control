import UIKit

struct AppearanceHelper {
    
    static var lambdaRed = UIColor(red: 212.0/255.0, green: 87.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = lambdaRed
        UIBarButtonItem.appearance().tintColor = .black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
    }
    
    static func style(view: UIView) {
        view.layer.cornerRadius = 30
    }
    
    static func style(control: CustomLockSlider) {
        control.layer.cornerRadius = 20
    }
}
