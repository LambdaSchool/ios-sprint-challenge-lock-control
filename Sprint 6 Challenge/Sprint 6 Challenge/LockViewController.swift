import UIKit

class LockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }
    
    @IBAction func resetButton(_ sender: Any) {
        // Insert code to reset the slider thumb position
    }
    
    // Materialize the lock slider above the image view
    @IBOutlet weak var lockSliderControl: LockSlider!
}
