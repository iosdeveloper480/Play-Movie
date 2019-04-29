//
//  LoadingVC.swift
//  PlayMovie
//
//  Created by Waqas Ali on 28/01/2019.
//  Copyright © 2019 Waqas Ali. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {

	@IBOutlet weak var textLabel: UILabel!

//	var textLabelText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
//		self.textLabel.text = "Doctors..."
    }

	public func setText(text: String) {
		self.textLabel.text = text
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
//		self.textLabel?.text = textLabelText
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
//		self.textLabel?.text = textLabelText
	}

}
