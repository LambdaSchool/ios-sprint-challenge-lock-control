import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //gray square
        let graySquare = UIView()
        graySquare.translatesAutoresizingMaskIntoConstraints = false
        graySquare.backgroundColor = .lightGray
        graySquare.layer.cornerRadius = 20
        view.addSubview(graySquare)
        
        let widthConstraintSq = NSLayoutConstraint(item: graySquare,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 200.0)
        
        let heightConstraintSq = NSLayoutConstraint(item: graySquare,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: graySquare,
                                                  attribute: .width,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        
        let centerYConstraintSq = NSLayoutConstraint(item: graySquare,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerY,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        let centerXConstraintSq = NSLayoutConstraint(item: graySquare,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        //cylinder
        let cylinder = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        cylinder.translatesAutoresizingMaskIntoConstraints = false
        cylinder.backgroundColor = .black
        cylinder.layer.cornerRadius = 40
        view.addSubview(cylinder)
        
        let topConstraintCy = NSLayoutConstraint(item: cylinder,
                                                 attribute: .bottom,
                                                 relatedBy: .equal,
                                                 toItem: graySquare,
                                                 attribute: .bottom,
                                                 multiplier: 1.0,
                                                 constant: -10.0)
        
        let bottomConstraintCy = NSLayoutConstraint(item: cylinder,
                                                    attribute: .centerX,
                                                    relatedBy: .lessThanOrEqual,
                                                    toItem: graySquare,
                                                    attribute: .centerX,
                                                    multiplier: 1.0,
                                                    constant: 0.0)
        

        let widthConstraintCy = NSLayoutConstraint(item: cylinder,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: graySquare,
                                                 attribute: .width,
                                                 multiplier: 1.0,
                                                 constant: 0.0)

        let heightConstraintCy = NSLayoutConstraint(item: cylinder,
                                                  attribute: .height,
                                                  relatedBy: .lessThanOrEqual,
                                                  toItem: graySquare,
                                                  attribute: .width,
                                                  multiplier: 1.0,
                                                  constant: 0.0)

        

        
        NSLayoutConstraint.activate([heightConstraintSq, widthConstraintSq, centerYConstraintSq, centerXConstraintSq, heightConstraintCy, widthConstraintCy, topConstraintCy, bottomConstraintCy])
        
    }
}

