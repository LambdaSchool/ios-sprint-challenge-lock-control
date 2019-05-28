
import UIKit

@IBDesignable class ViewController: UIViewController {

    //let customControl = CustomControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set navigation title
        navigationItem.title = "Unlock Me!"

        navigationItem.rightBarButtonItem?.tintColor = .clear
        
        // Set locked image
        imageView.image = UIImage(named: "Locked")
        
        // Set view colors
        mainView.backgroundColor = UIColor.pastelBlue
        sliderView.backgroundColor = UIColor.almond
        
        // Round view corners
        mainView.layer.cornerRadius = 30
        sliderView.layer.cornerRadius = 25
        
    }

    
    @IBAction func sliderValueChanged(_ sender: CustomControl) {
        
        if customControl.isUnlocked == true {
            
            navigationItem.rightBarButtonItem?.tintColor = .wenge
            
            imageView.image = UIImage(named: "Unlocked")
            
            // Disable user interaction once unlocked
            customControl.isUserInteractionEnabled = false
        }
    }


    @IBAction func reset(_ sender: Any) {
        
        // When reset is tapped, button disappears
        resetOutlet.tintColor = UIColor.clear
        
        // Value of slider goes back to 0
        customControl.reset()
        
        // Image changes to locked image
        imageView.image = UIImage(named: "Locked")
        
    }
    
    @IBOutlet weak var customControl: CustomControl!
    
    
    @IBOutlet weak var resetOutlet: UIBarButtonItem!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var sliderView: UIView!
    
}

