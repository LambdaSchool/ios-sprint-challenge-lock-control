import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //gray square
        let graySquare = UIView()
        graySquare.translatesAutoresizingMaskIntoConstraints = false
        graySquare.backgroundColor = .gray
        graySquare.layer.cornerRadius = 20
        view.addSubview(graySquare)
        
        let widthConstraint = NSLayoutConstraint(item: graySquare,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 200.0)
        
        let heightConstraint = NSLayoutConstraint(item: graySquare,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: graySquare,
                                                  attribute: .width,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        
        let centerYConstraint = NSLayoutConstraint(item: graySquare,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerY,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        let centerXConstraint = NSLayoutConstraint(item: graySquare,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        NSLayoutConstraint.activate([heightConstraint, widthConstraint, centerYConstraint, centerXConstraint])
    }
    
    
}

