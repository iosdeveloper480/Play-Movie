//
//  WASearchBar.swift
//  PlayMovie
//
//  Created by Waqas Ali on 24/11/2018.
//  Copyright © 2018 Waqas Ali. All rights reserved.
//

import UIKit

@IBDesignable class WASearchBar: UISearchBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

	@IBInspectable var searchTextFieldColor: UIColor = UIColor.white {
		didSet {
			for subView in self.subviews
			{
				for subView1 in subView.subviews
				{
					if subView1.isKind(of: UITextField.self)
					{
						subView1.backgroundColor = searchTextFieldColor
					}
				}

			}
		}
	}

	@IBInspectable var placeholderColor: UIColor = UIColor.white {
		didSet {
			self.setPlaceholderTextColorTo(color: placeholderColor)
		}
	}

	@IBInspectable var searchIconColor: UIColor? {

		didSet {

			if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField,
				let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {

				//Magnifying glass
				glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
				glassIconView.tintColor = searchIconColor

			}

		}
	}

	@IBInspectable var textColor: UIColor? {
		didSet {
			let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
			textFieldInsideSearchBar?.textColor = textColor
		}
	}

	@IBInspectable var clearButtonColor: UIColor = UIColor.white {
		didSet {
			if let clearButton = self.value(forKey: "clearButton") as? UIButton {
				clearButton.setImage(UIImage(named: "ic_clear"), for: .normal)
				clearButton.tintColor = clearButtonColor
			}
		}
	}

	@IBInspectable var cancelButtonTintColor: UIColor = UIColor.clear {
		didSet {
			for subview in self.subviews {
				if subview.isKind(of: UIButton.self) { //checking if it is a button
					subview.tintColor = cancelButtonTintColor
				}
			}
		}
	}

}

extension WASearchBar
{
	func setPlaceholderTextColorTo(color: UIColor)
	{
		let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
		textFieldInsideSearchBar?.textColor = color
		let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
		textFieldInsideSearchBarLabel?.textColor = color
	}

	func setMagnifyingGlassColorTo(color: UIColor)
	{
		let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
		let glassIconView = textFieldInsideSearchBar?.leftView as? UIImageView
		glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
		glassIconView?.tintColor = color
	}
}
