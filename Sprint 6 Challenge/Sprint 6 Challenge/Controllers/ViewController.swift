import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var reset: UIBarButtonItem!
    @IBOutlet weak var lockView: UIImageView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var sliderView: UIView!
    
    @IBAction func reset(_ sender: Any) {
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Unlock"
        
        view.backgroundColor = .darkOrange
    }


}

