//
//  UISearchExten.swift
//  PlayMovie
//
//  Created by Waqas Ali on 28/01/2019.
//  Copyright © 2019 Waqas Ali. All rights reserved.
//

import UIKit

extension UISearchBar {

	public func setTextColor(_ color: UIColor) {
		let svs = subviews.flatMap { $0.subviews }
		guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
		tf.textColor = color
	}

	private func getViewElement<T>(type: T.Type) -> T? {

		let svs = subviews.flatMap { $0.subviews }
		guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
		return element
	}

	func getSearchBarTextField() -> UITextField? {

		return getViewElement(type: UITextField.self)
	}

	func setTextColor(color: UIColor) {

		if let textField = getSearchBarTextField() {
			textField.textColor = color
		}
	}

	func setTextFieldColor(color: UIColor) {

		if let textField = getViewElement(type: UITextField.self) {
			switch searchBarStyle {
			case .minimal:
				textField.layer.backgroundColor = color.cgColor
				textField.layer.cornerRadius = 6

			case .prominent, .default:
				textField.backgroundColor = color
            @unknown default:
                fatalError()
            }
		}
	}

	func setPlaceholderTextColor(color: UIColor) {

		if let textField = getSearchBarTextField() {
			textField.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: color])
		}
	}

	func setTextFieldClearButtonColor(color: UIColor) {

		if let textField = getSearchBarTextField() {

			let button = textField.value(forKey: "clearButton") as! UIButton
			if let image = button.imageView?.image {
				button.setImage(image.transform(withNewColor: color), for: .normal)
			}
		}
	}

	func setSearchImageColor(color: UIColor) {

		if let imageView = getSearchBarTextField()?.leftView as? UIImageView {
			imageView.image = imageView.image?.transform(withNewColor: color)
		}
	}
}
