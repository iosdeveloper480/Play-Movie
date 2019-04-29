//
//  WALabel.swift
//
//  Created by Waqas Ali on 1/5/17.
//  Copyright © 2017 Jamisofttech. All rights reserved.
//

import UIKit

@IBDesignable class WALabel: UILabel {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    @IBInspectable var transformAngle:Double = 0.0 {
        didSet {
            self.transform = self.transform.rotated(by: CGFloat(Double.pi/transformAngle))
        }
    }
//    @IBInspectable var transformAngle:CGFloat = 0.0 {
//        didSet {
//            self.transform = self.transform.rotated(by: transformAngle)
//        }
//    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }

	@IBInspectable var borderWidth:CGFloat = 0.0 {
		didSet {
			self.layer.borderWidth = borderWidth
		}
	}

	@IBInspectable var circular: Bool = false {
		didSet {
			self.layer.cornerRadius = self.frame.width/2
		}
	}

	@IBInspectable var borderColor:UIColor = UIColor.black {
		didSet {
			self.layer.borderColor = borderColor.cgColor
			if borderWidth != 0 {
				borderWidth = 1
			}
		}
	}
}
