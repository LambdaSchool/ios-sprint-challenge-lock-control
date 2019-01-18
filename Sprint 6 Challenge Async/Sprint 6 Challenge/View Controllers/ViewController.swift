
import UIKit

@IBDesignable class ViewController: UIViewController {

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


    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var sliderView: UIView!
    
}

