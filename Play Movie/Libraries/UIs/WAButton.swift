//
//  WAButton.swift
//
//  Created by Waqas Ali on 12/26/15.
//  Copyright © 2015 Jamisofttech. All rights reserved.
//

import UIKit

class WAButton: UIButton {
    
    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    @IBInspectable var transformAngle:Double = 0.0 {
        didSet {
            self.transform = self.transform.rotated(by: CGFloat(Double.pi/transformAngle))
        }
    }
    
    @IBInspectable var backgroundColors: UIColor = UIColor.clear {
        didSet {
            self.layer.backgroundColor = backgroundColors.cgColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
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
    
    func addTopBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func getWAViewBounds() -> CGRect {
        return self.bounds
    }
    
//    button.imageEdgeInsets = UIEdgeInsetsMake(0., button.frame.size.width - (image.size.width + 15.), 0., 0.);
//    button.titleEdgeInsets = UIEdgeInsetsMake(0., 0., 0., image.size.width);
    
    @IBInspectable var setImageRight: Bool = false {
        didSet {
            
            if let buttonImageView = self.imageView , setImageRight {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.size.width - (buttonImageView.image!.size.width + 10), bottom: 0, right: 0)
                titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: buttonImageView.image!.size.width + 20)
            }
            
        }
    }
    
// Func write at 6 Jan 2016 WA
    @IBInspectable var imageName: String = "" {
        didSet {
            let origImage = UIImage(named: imageName);
            self.contentMode = UIView.ContentMode.center
            let tintedImage = origImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            self.setImage(tintedImage, for: UIControl.State())
            
        }
    }

    @IBInspectable var setShadow: Bool = false {
        didSet {
            setShadow = true
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowOpacity = shadowOpacity
            }
        }
    }
    
    @IBInspectable var shadowOffsetWidth:CGFloat = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowOffset.width = shadowOffsetWidth
            }
        }
    }
    
    @IBInspectable var shadowOffsetHeight:CGFloat = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowOffset.height = shadowOffsetHeight
            }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowRadius = shadowRadius
            }
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            if setShadow {
                self.layer.shadowColor = shadowColor.cgColor
            }
        }
    }
    
    @IBInspectable var selectedColor: UIColor = .clear {
        didSet {
            if isSelected {
                self.layer.backgroundColor = selectedColor.cgColor
            }
        }
    }
    
    @IBInspectable var unSelectedColor: UIColor = .clear {
        didSet {
            if !isSelected {
                self.layer.backgroundColor = unSelectedColor.cgColor
            }
        }
    }
    
    @IBInspectable var checkedColor: UIColor = .clear {
        didSet {
            self.layer.backgroundColor = checkedColor.cgColor
        }
    }
    
    @IBInspectable var unCheckedColor: UIColor = .clear {
        didSet {
            self.layer.backgroundColor = unCheckedColor.cgColor
        }
    }
    
    
    
    @IBInspectable var fillColor: UIColor = UIColor.black
    @IBInspectable var unFillColor: UIColor = UIColor.black
    
    func checkIcon() {
        //// Color Declarations
        let fillColor = self.fillColor
        
        //// checked.svg Group
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: 512))
        bezierPath.addLine(to: CGPoint(x: 512, y: 512))
        bezierPath.addLine(to: CGPoint(x: 512, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 379.69, y: 190.54))
        bezierPath.addLine(to: CGPoint(x: 243.16, y: 344.14))
        bezierPath.addCurve(to: CGPoint(x: 230.39, y: 349.87), controlPoint1: CGPoint(x: 239.8, y: 347.92), controlPoint2: CGPoint(x: 235.11, y: 349.87))
        bezierPath.addCurve(to: CGPoint(x: 219.73, y: 346.13), controlPoint1: CGPoint(x: 226.65, y: 349.87), controlPoint2: CGPoint(x: 222.88, y: 348.64))
        bezierPath.addLine(to: CGPoint(x: 134.4, y: 277.86))
        bezierPath.addCurve(to: CGPoint(x: 131.74, y: 253.88), controlPoint1: CGPoint(x: 127.04, y: 271.98), controlPoint2: CGPoint(x: 125.85, y: 261.24))
        bezierPath.addCurve(to: CGPoint(x: 155.72, y: 251.2), controlPoint1: CGPoint(x: 137.62, y: 246.52), controlPoint2: CGPoint(x: 148.37, y: 245.32))
        bezierPath.addLine(to: CGPoint(x: 228.4, y: 309.34))
        bezierPath.addLine(to: CGPoint(x: 354.18, y: 167.85))
        bezierPath.addCurve(to: CGPoint(x: 378.27, y: 166.43), controlPoint1: CGPoint(x: 360.42, y: 160.8), controlPoint2: CGPoint(x: 371.23, y: 160.16))
        bezierPath.addCurve(to: CGPoint(x: 379.69, y: 190.54), controlPoint1: CGPoint(x: 385.31, y: 172.71), controlPoint2: CGPoint(x: 385.95, y: 183.49))
        bezierPath.close()
        fillColor.setFill()
        bezierPath.fill()
    }
    
    func unCheckIcon() {
        //// Color Declarations
        let fillColor = self.unFillColor
        
        //// checked.svg Group
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: 512))
        bezierPath.addLine(to: CGPoint(x: 512, y: 512))
        bezierPath.addLine(to: CGPoint(x: 512, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 379.69, y: 190.54))
        bezierPath.addLine(to: CGPoint(x: 243.16, y: 344.14))
        bezierPath.addCurve(to: CGPoint(x: 230.39, y: 349.87), controlPoint1: CGPoint(x: 239.8, y: 347.92), controlPoint2: CGPoint(x: 235.11, y: 349.87))
        bezierPath.addCurve(to: CGPoint(x: 219.73, y: 346.13), controlPoint1: CGPoint(x: 226.65, y: 349.87), controlPoint2: CGPoint(x: 222.88, y: 348.64))
        bezierPath.addLine(to: CGPoint(x: 134.4, y: 277.86))
        bezierPath.addCurve(to: CGPoint(x: 131.74, y: 253.88), controlPoint1: CGPoint(x: 127.04, y: 271.98), controlPoint2: CGPoint(x: 125.85, y: 261.24))
        bezierPath.addCurve(to: CGPoint(x: 155.72, y: 251.2), controlPoint1: CGPoint(x: 137.62, y: 246.52), controlPoint2: CGPoint(x: 148.37, y: 245.32))
        bezierPath.addLine(to: CGPoint(x: 228.4, y: 309.34))
        bezierPath.addLine(to: CGPoint(x: 354.18, y: 167.85))
        bezierPath.addCurve(to: CGPoint(x: 378.27, y: 166.43), controlPoint1: CGPoint(x: 360.42, y: 160.8), controlPoint2: CGPoint(x: 371.23, y: 160.16))
        bezierPath.addCurve(to: CGPoint(x: 379.69, y: 190.54), controlPoint1: CGPoint(x: 385.31, y: 172.71), controlPoint2: CGPoint(x: 385.95, y: 183.49))
        bezierPath.close()
        fillColor.setFill()
        bezierPath.fill()
    }
    
}

@IBDesignable
class LeftAlignedIconButton: UIButton {
	override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
		let titleRect = super.titleRect(forContentRect: contentRect)
		let imageSize = currentImage?.size ?? .zero
		let availableWidth = contentRect.width - imageEdgeInsets.right - imageSize.width - titleRect.width
		return titleRect.offsetBy(dx: round(availableWidth / 2), dy: 0)
	}
}
