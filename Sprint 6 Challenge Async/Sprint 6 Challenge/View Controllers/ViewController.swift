
import UIKit

@IBDesignable class ViewController: UIViewController {

    let customControl = CustomControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set navigation title
        navigationItem.title = "Unlock Me!"
        
        // Set view colors
        mainView.backgroundColor = UIColor.pastelBlue
        sliderView.backgroundColor = UIColor.almond
        
        // Round view corners
        mainView.layer.cornerRadius = 30
        sliderView.layer.cornerRadius = 25
        
    }

    @IBAction func reset(_ sender: Any) {
        
        // When reset is tapped, button disappears
        resetOutlet.tintColor = UIColor.clear
        
        // Value of slider goes back to 0
        customControl.thumbValue = 0
        
        // Image changes to locked image
        imageView.image = UIImage(named: "Locked")
        
    }
    
    @IBOutlet weak var resetOutlet: UIBarButtonItem!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var sliderView: UIView!
    
}

