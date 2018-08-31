import UIKit

func rect2(_ x:Double, _ y:Double, _ w:Double, _ h:Double)-> CGRect
{
	return CGRect(
		x:CGFloat(x),
		y:CGFloat(y),
		width:CGFloat(w),
		height:CGFloat(h)
	)
}

func rect2(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat)-> CGRect
{
	return CGRect(
		x:CGFloat(x),
		y:CGFloat(y),
		width:CGFloat(w),
		height:CGFloat(h)
	)
}

func v2(_ x:Float, _ y:Float) -> CGPoint
{
	return CGPoint(x:CGFloat(x), y:CGFloat(y))
}

@IBDesignable
class LockControl:UIControl
{
	let lockedImg = UIImage(named: "Locked")
	let unlockedImg = UIImage(named: "Unlocked")

	var lockView:UIImageView!
	var sliderFrameView:UIView!
	var sliderView:UIView!

	var slideAmount = 0.0
	let sliderSize = CGFloat(40.0)
	let sliderFrameSize = CGFloat(16 + 40)

	var sliderStartX = CGFloat(0.0)
	var sliderEndX = CGFloat(0.0)
	var sliderY = CGFloat(0.0)
	var startTouch:CGPoint = v2(0, 0)

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		self.backgroundColor = UIColor.lightGray
		self.layer.cornerRadius = sliderSize

		let imgSize = min(self.frame.width, self.frame.height) / 2
		lockView = UIImageView(frame: rect2(
			self.bounds.midX - imgSize / 2, self.bounds.midY - imgSize/1.5,
			imgSize, imgSize))
		lockView.image = lockedImg
		lockView.contentMode = .scaleAspectFit
		addSubview(lockView)

		sliderFrameView = UIView(frame: rect2(
			16.0 , self.bounds.height - sliderFrameSize - 16,
			self.bounds.width - 32, sliderFrameSize))
		sliderFrameView.backgroundColor = UIColor.gray
		let sff = sliderFrameView.frame
		sliderFrameView.layer.cornerRadius = min(sff.width, sff.height) / 2
		sliderFrameView.isUserInteractionEnabled = false
		addSubview(sliderFrameView)

		sliderStartX = sff.origin.x + 8
		sliderEndX = sff.origin.x + sff.width - 8 - sliderSize
		sliderY = sff.origin.y + 8
		sliderView = UIView(frame: rect2(sliderStartX, sliderY, sliderSize, sliderSize))
		sliderView.backgroundColor = .black
		sliderView.layer.cornerRadius = sliderSize / 2
		sliderView.isUserInteractionEnabled = false
		addSubview(sliderView)


	}

	@IBAction func resetLock(_ sender:Any)
	{
		unlock()
	}

	// "unlock"
	// these instructions are weird.
	func lock()
	{
		self.lockView.image = unlockedImg
		self.isUserInteractionEnabled = false
		UIView.animate(withDuration: 0.25) {
			self.sliderView.frame.origin.x = self.sliderEndX
		}
	}

	func unlock()
	{
		self.lockView.image = lockedImg
		self.isUserInteractionEnabled = true
		UIView.animate(withDuration: 0.25) {
			self.sliderView.frame.origin.x = self.sliderStartX
		}
	}


	func handleTouch(_ touch: UITouch, finished:Bool = false)
	{
		var sf = sliderView.frame
		sf.origin.x = touch.location(in: self).x - startTouch.x
		if sf.origin.x < sliderStartX {
			sf.origin.x = sliderStartX
		} else if sf.origin.x > sliderEndX {
			sf.origin.x = sliderEndX
		}
		sliderView.frame = sf

		slideAmount = Double((sf.origin.x - sliderStartX) / (sliderEndX - sliderStartX))

		if finished {
			if slideAmount > 0.8 {
				// unlock
				lock()
			} else {
				//relock... it's dumb
				unlock()
			}
		}
	}

	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		print(touch.location(in: sliderView))
		if sliderView.bounds.contains(touch.location(in: sliderView)) {
			startTouch = touch.location(in: sliderView)
			sendActions(for: [.touchDown])
			handleTouch(touch)
			return true
		}
		return false
	}

	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		handleTouch(touch)

		if sliderFrameView.point(inside: touch.location(in: sliderFrameView), with: event) {
			sendActions(for: [.touchDragInside])
		} else {
			sendActions(for: [.touchDragOutside])
		}
		return true
	}

	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		defer { super.endTracking(touch, with: event) }
		guard let touch = touch else { return }
		handleTouch(touch, finished: true)
		if sliderFrameView.point(inside: touch.location(in: sliderFrameView), with: event) {
			sendActions(for: [.touchUpInside])
		} else {
			sendActions(for: [.touchUpOutside])
		}
	}

	override func cancelTracking(with event: UIEvent?) {
		sendActions(for: [.touchCancel])
	}
}

