//
//  WAView.swift
//
//  Created by Waqas Ali on 12/25/15.
//  Copyright © 2015 Jamisofttech. All rights reserved.
//

import UIKit

@IBDesignable class WAView: UIView {

    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
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
    
    @IBInspectable var setShadow: Bool = false {
        didSet {
            setShadow = true
            if setShadow {
                self.layer.masksToBounds = false
            }
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
    
    @IBInspectable var shadowOffSet: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            if setShadow {
                self.layer.shadowOffset = shadowOffSet
            }
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            if setShadow {
                self.layer.shadowColor = shadowColor.cgColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
