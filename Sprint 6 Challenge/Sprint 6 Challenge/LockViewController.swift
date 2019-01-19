import UIKit

class LockViewController: UIViewController {

    // Utilize the control properties on the main view to render the images, sliders, etc.
    override func viewDidLoad() {
        super.viewDidLoad()
        lockSliderControl.lockSetup()
    }
    
    // Hook up the reset button to manipulate the slider via the control
    @IBAction func resetButton(_ sender: Any) {
        lockSliderControl.resetSliderThumbPosition()
    }
    
    // Materialize the lock slider above the image view
    @IBOutlet weak var lockSliderControl: LockSlider!
}
