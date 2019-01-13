//
//  Animator+Views.swift
//  Sprint 6 Challenge
//
//  Created by William Bundy on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

protocol LockImageProvider
{
	var lockView:UIImageView! { get }
}

typealias LockImageVC = LockImageProvider & UIViewController

class MainVC:UIViewController, LockImageProvider, UINavigationControllerDelegate
{
	var lockView: UIImageView! {
		return lock.unlockView
	}

	@IBOutlet weak var lock: LockControl!
	var otherVC:OtherVC!
	let animator = Animator()

	override func viewDidLoad()
	{
		navigationController?.delegate = self
		otherVC = storyboard?.instantiateViewController(withIdentifier: "OtherVC") as! OtherVC
	}

	@IBAction func segueToOther(_ sender:Any)
	{
		navigationController?.show(otherVC, sender: self)
	}

	func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return animator
	}

}

class OtherVC:UIViewController, LockImageProvider
{
	@IBOutlet weak var picture: UIImageView!
	var lockView: UIImageView! {
		return picture
	}
}

class Animator:NSObject, UIViewControllerAnimatedTransitioning
{
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 1.0
	}

	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard
			let fromVC = transitionContext.viewController(forKey: .from) as? LockImageVC,
			let toVC = transitionContext.viewController(forKey: .to) as? LockImageVC,
			let toView = transitionContext.view(forKey: .to),
			let fromView = transitionContext.view(forKey: .from)
			else {
				print("Couldn't resolve to/from as correct types")
				return
		}

		let container = transitionContext.containerView
		container.backgroundColor = .white
		container.addSubview(toView)
		toView.alpha = 0
		toView.layoutIfNeeded()

		toVC.lockView.alpha = 0
		fromVC.lockView.alpha = 0
		let animView = UIImageView(frame: container.convert(fromVC.lockView.bounds, from: fromVC.lockView))
		animView.image = fromVC.lockView.image
		animView.contentMode = .scaleAspectFit
		container.addSubview(animView)

		UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
			animView.frame = container.convert(toVC.lockView.bounds, from: toVC.lockView)
			toView.alpha = 1
			fromView.alpha = 0
		}) { success in
			animView.removeFromSuperview()
			toVC.lockView.alpha = 1
			fromVC.lockView.alpha = 1
			transitionContext.completeTransition(true)
		}
	}
}
