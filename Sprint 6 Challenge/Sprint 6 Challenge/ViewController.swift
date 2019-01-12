

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageOutlet: UIImageView!
    @IBOutlet weak var resetOutlet: UIBarButtonItem!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var swipeSlider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        // Make reset button visible
        UIView.animate(withDuration: 0.5) {
            self.resetOutlet.tintColor = AppearanceHelper.wenge
        }
    }
    
    
    let lockedImage = UIImage(named: "Locked")
    let unlockedImage = UIImage(named: "Unlocked")
    
    let lockImagesArray: [UIImage] = [UIImage(named: "Locked")!, UIImage(named: "Unlocked")!]
    
    @IBAction func resetButton(_ sender: Any) {
        
        // When reset is tapped, button disappears
        resetOutlet.tintColor = UIColor.clear
        
        // Value of slider goes back to 0
        swipeSlider.value = 0
        
        // Image changes to locked image
        imageOutlet = UIImageView(image: UIImage(named: "Locked")!)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set navigation title
        navigationItem.title = "Unlock Me!"
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: AppearanceHelper.almond, NSAttributedStringKey.font: AppearanceHelper.customFont]
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        // Rounded corners on UIViews
        mainView.layer.cornerRadius = 50
        swipeView.layer.cornerRadius = 25
        
        swipeView.backgroundColor = AppearanceHelper.almond
        mainView.backgroundColor = AppearanceHelper.pastelBlue
        
        // Set image
        imageOutlet = UIImageView(image: lockedImage!)
        
        // Disable Reset button
        resetOutlet.tintColor = UIColor.clear
        
    }
}





//        // Create main view
//        let almondView = UIView()
//        almondView.translatesAutoresizingMaskIntoConstraints = false
//
//        // Background color
//        almondView.backgroundColor = AppearanceHelper.almond
//
//        // Add it as a subview
//        view.addSubview(almondView)
//
//        // Width constraint
//        let widthConstraint = NSLayoutConstraint(item: almondView,
//                                                 attribute: .width,
//                                                 relatedBy: .equal,
//                                                 toItem: nil,
//                                                 attribute: .notAnAttribute,
//                                                 multiplier: 1.0,
//                                                 constant: 300.0)
//
//        // Height constraint
//        let heightConstraint = NSLayoutConstraint(item: almondView,
//                                                 attribute: .height,
//                                                 relatedBy: .equal,
//                                                 toItem: almondView,
//                                                 attribute: .width,
//                                                 multiplier: 1.0,
//                                                 constant: 0)
//
//        // Center vertically
//        let centerYConstraint = NSLayoutConstraint(item: almondView,
//                                                 attribute: .centerY,
//                                                 relatedBy: .equal,
//                                                 toItem: view,
//                                                 attribute: .centerY,
//                                                 multiplier: 1.0,
//                                                 constant: 0.0)
//
//        // Center horizontally
//        let centerXConstraint = NSLayoutConstraint(item: almondView,
//                                                   attribute: .centerX,
//                                                   relatedBy: .equal,
//                                                   toItem: view,
//                                                   attribute: .centerX,
//                                                   multiplier: 1.0,
//                                                   constant: 0.0)
//
//
//
//        // Create image view inside the almond view
//        let lockedImage = UIImage(named: "Locked")
//        let lockedImageView = UIImageView(image: lockedImage!)
//        lockedImageView.frame = CGRect(x: 100, y: 100, width: 100, height: 150)
//        view.addSubview(lockedImageView)
//
//        // Locked Image Constraints
//
//        let imageWidthConstraint = NSLayoutConstraint(item: lockedImageView,
//                                                 attribute: .width,
//                                                 relatedBy: .equal,
//                                                 toItem: nil,
//                                                 attribute: .notAnAttribute,
//                                                 multiplier: 1.0,
//                                                 constant: 150.0)
//
//        let imageHeightConstraint = NSLayoutConstraint(item: lockedImageView,
//                                                  attribute: .height,
//                                                  relatedBy: .equal,
//                                                  toItem: lockedImageView,
//                                                  attribute: .width,
//                                                  multiplier: 1.0,
//                                                  constant: 0)
//
//        let imageCenterYConstraint = NSLayoutConstraint(item: lockedImageView,
//                                                        attribute: .centerY,
//                                                        relatedBy: .equal,
//                                                        toItem: view,
//                                                        attribute: .centerY,
//                                                        multiplier: 1.0,
//                                                        constant: 0.0)
//
//        let imageCenterXConstraint = NSLayoutConstraint(item: lockedImageView,
//                                                        attribute: .centerX,
//                                                        relatedBy: .equal,
//                                                        toItem: view,
//                                                        attribute: .centerX,
//                                                        multiplier: 1.0,
//                                                        constant: 0.0)
//
//
//
//        // Add these constraints to a view
//        NSLayoutConstraint.activate([widthConstraint, heightConstraint, centerYConstraint, centerXConstraint, imageWidthConstraint, imageHeightConstraint, imageCenterYConstraint, imageCenterXConstraint])
