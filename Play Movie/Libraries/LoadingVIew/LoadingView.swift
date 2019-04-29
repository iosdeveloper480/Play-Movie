//
//  LoadingView.swift
//  CustomCollectionView
//
//  Created by Waqas Ali on 8/22/16.
//  Copyright © 2016 dinosoftlabs. All rights reserved.
//

import UIKit

enum LoaderType {
	case normal
	case expanded
}

class LoadingView: UIView {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    var nibName = "LoadingView"
    var view: UIView!
	var loaderType = LoaderType.normal
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromXib()
        view.frame = self.bounds
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight , UIView.AutoresizingMask.flexibleWidth]
        addSubview(view)
    }
    
    func loadViewFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName , bundle: bundle)
		var view = UIView()
		if self.loaderType == .normal {
			view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
		}else if self.loaderType == .expanded {
			let views = nib.instantiate(withOwner: self, options: nil)[1] as! UIViewController
			view = views.view
		}
        
        return view
    }

    func showLoadingView(_ vc: UIViewController) {
        var frame = self.frame
		if self.loaderType == .normal {
			if isIPad {
				frame.size.width = 260
				frame.size.height = 100
			}else {
				frame.size.width = 130
				frame.size.height = 50
			}
		}else if self.loaderType == .expanded {
			if isIPad {
                frame.size.width = vc.view.frame.size.width - 160
				frame.size.height = vc.view.frame.size.width - 160
			}else {
				frame.size.width = vc.view.frame.size.width - 80
				frame.size.height = vc.view.frame.size.width - 80
            }
        }
        self.frame = frame
        self.center = vc.view.center
        self.isHidden = false
        
        UIView.animate(withDuration: 0.9, animations: { 
//            self.alpha = 0.8
            }, completion: { (finished) in
                
        })
        vc.view.isUserInteractionEnabled = false
        vc.view.addSubview(self)
        vc.view.bringSubviewToFront(self)
    }

	func showLoadingExpanded(viewFor vc: UIViewController) {

		self.xibSetup()

		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.masksToBounds = false
		self.layer.shadowOpacity = 1.0
		self.layer.shadowOffset = CGSize(width: 0, height: 0)
		self.layer.cornerRadius = 4
		self.layer.shadowRadius = 1

		var frame = self.frame
		if isIPad {
			frame.size.width = vc.view.frame.size.width - 160
			frame.size.height = vc.view.frame.size.width - 400
		}else {
			frame.size.width = vc.view.frame.size.width - 80
			frame.size.height = vc.view.frame.size.width - 200
		}
		self.frame = frame
		self.center = vc.view.center
		self.isHidden = false

		//        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
		//            self.transform = CGAffineTransformIdentity;
		//            } completion:^(BOOL finished) {
		//            }];
		//
		//        [vc.view addSubview:self];

		UIView.animate(withDuration: 0.9, animations: {
			//            self.alpha = 0.8
		}, completion: { (finished) in

		})
		vc.view.isUserInteractionEnabled = false
		vc.view.addSubview(self)
		vc.view.bringSubviewToFront(self)
	}
    
    func hideLoadingView(_ vc:UIViewController) {
        vc.view.isUserInteractionEnabled = true
        self.isHidden = true
        self.removeFromSuperview()
    }
}
