//
//  PlayMovie.swift
//  PlayMovie
//
//  Created by Waqas Ali on 11/20/16.
//  Copyright © 2016 Dinosoftlabs. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class PlayMovieUtility: NSObject {
    
    static let sharedPlayMovieUtility = PlayMovieUtility()
	var loadingView = LoadingView()
    var banner = Banner()
    let lebel = UILabel(frame: CGRect(origin: CGPoint(x: 0,y: 0), size: CGSize(width: 200, height: 30)))
    
//    fileprivate var _activeUser:UserMovie?
//    var activeUser:UserMovie? {
//        get {
//            if (_activeUser == nil) {
//                _activeUser = UserMovie.getCurrentUser()
//            }
//            return _activeUser
//        }
//        set {
//            if (_activeUser != newValue) {
//                _activeUser = newValue
//                _ = _activeUser!.saveUser()
//            }
//        }
//    }
    
    //    // MARK: Alert Messages
    
    func showAlert(_ error: String, VC: UIViewController) {
        
        let alertView = UIAlertController(title: "Oops", message: error, preferredStyle:
            UIAlertController.Style.alert)
        
        alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        VC.present(alertView, animated: true, completion: nil)
        
    }
    
    func showAlertWithTitle(_ title: String ,error: String,OKButton okButtonTitle:String ,VC: AnyObject) {
        
        let alertView = UIAlertController(title: title, message: error, preferredStyle:
            UIAlertController.Style.alert)
        alertView.addAction(UIAlertAction(title: okButtonTitle , style: UIAlertAction.Style.default, handler: nil))
        VC.present(alertView, animated: true, completion: nil)
        
    }
    
    func showNoNetworkAlert() {
        showCancelTypeAlert(titleNetworkError, message: messageNetworkError, buttonTitle: buttonOK, onController: UIApplication.shared.keyWindow?.rootViewController)
    }
    
    func showAlert(_ error:NSError, onController parentVC: UIViewController!) {
        showCancelTypeAlert(titleServerError, message: error.localizedDescription, buttonTitle: buttonOK, onController: parentVC)
    }
    
//    func showCancelTypeAlert(title: String!, message: String!, buttonTitle bTitle: String!, onController parentVC: UIViewController!) {
//        self.showAlert(title: title, message: message, buttonsDictionary: ["": {($0)}, bTitle: {(alertAction: UIAlertAction!) -> Void in} as! (Optional<UIAlertAction>) -> ()], baseController: parentVC)
//    }
    
    func showCancelTypeAlert(_ title: String!, message: String!, buttonTitle bTitle: String!, onController parentVC: UIViewController!) {
        //            self.showAlert(title: title, message: message, buttonsDictionary: ["": {($0)}, bTitle: {(alertAction: UIAlertAction!) -> Void in} as! (Optional<UIAlertAction>) -> ()], baseController: parentVC)
        self.showAlert2(title, message: message,baseController: parentVC)
    }
    
    func showAlert2(_ title: String?, message: String?, baseController parentVC: UIViewController!) {
        
        let alertController: UIAlertController = UIAlertController(title: title,
                                                                   message: message,
                                                                   preferredStyle: UIAlertController.Style.alert)
        let style = UIAlertAction.Style.destructive
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: style, handler: nil)
        alertController.addAction(alertAction)
        
        //        var count: Int = 0
        //        for (bTitle, bAction) in buttons {
        //            if bTitle != "" {
        //                var style: UIAlertAction.Style = UIAlertAction.Style.destructive
        //                if count > 1 {
        //                    style = UIAlertAction.Style.destructive
        //                } else if count == 1 {
        //                    style = UIAlertAction.Style.default
        //                } else {
        //                    style = UIAlertAction.Style.cancel
        //                }
        //
        //                let alertAction: UIAlertAction = UIAlertAction(title: bTitle, style: style, handler: bAction)
        //                alertController.addAction(alertAction)
        //            }
        //            count += 1
        //        }
        //        parentVC.presentViewController(alertController)
        parentVC.present(alertController, animated: true, completion: nil)
    }

    func showAlert(_ title: String?, message: String?, buttonsDictionary buttons: Dictionary<String, (UIAlertAction?) -> Void>!, baseController parentVC: UIViewController!) {
        
        let alertController: UIAlertController = UIAlertController(title: title,
                                                                   message: message,
                                                                   preferredStyle: UIAlertController.Style.alert)
        
        var count: Int = 0
        for (bTitle, bAction) in buttons {
            if bTitle != "" {
                var style: UIAlertAction.Style = UIAlertAction.Style.destructive
                if count > 1 {
                    style = UIAlertAction.Style.destructive
                } else if count == 1 {
                    style = UIAlertAction.Style.default
                } else {
                    style = UIAlertAction.Style.cancel
                }
                
                let alertAction: UIAlertAction = UIAlertAction(title: bTitle, style: style, handler: bAction)
                alertController.addAction(alertAction)
            }
            count += 1
        }
        //                parentVC.presentViewController(alertController)
        parentVC.present(alertController, animated: true, completion: nil)
    }
    
    func connectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags : SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }

    func loadingView(_ vc:UIViewController,wantToShow isShow:Bool) {
        if isShow {
			loadingView = LoadingView()
			loadingView.loaderType = .normal
            loadingView.activity.startAnimating()
            loadingView.showLoadingView(vc)
        }else {
            loadingView.activity.stopAnimating()
            loadingView.hideLoadingView(vc)
        }
    }

	func loading(viewFor vc:UIViewController,wantToShow isShow:Bool) {
		if isShow {
//			loadingView.activity.startAnimating()
			loadingView.loaderType = .expanded
			loadingView.showLoadingExpanded(viewFor: vc)
		}else {
//			loadingView.activity.stopAnimating()
			loadingView.hideLoadingView(vc)
		}
	}
    
//    func loadingViewIntoView(_ view:UIView ,wantToShow isShow:Bool) {
//        if isShow {
//            loadingView.activity.startAnimating()
//            loadingView.showLoadingViewIntoView(view)
//        }else {
//            loadingView.activity.stopAnimating()
//            loadingView.hideLoadingViewFromView(view)
//        }
//    }

    func showBanner(_ vc: UIViewController, title:String?, subTitle: String?, image: UIImage?, backgroundColor: UIColor, wantToShow: Bool) {
        if wantToShow {
//            banner = Banner(title: title, subtitle: subTitle, image: image, backgroundColor: UIColor.brown, didTapBlock: {
//
//            })
//            banner.dismissesOnTap = true
//            banner.show(nil)
            
            banner = Banner(title: title, subtitle: subTitle, image: nil, backgroundColor: UIColor(red: 0/255, green: 137/255, blue: 123/255, alpha: 1.0), didTapBlock: {
                
            })
            banner.tintColor = UIColor.white
            banner.titleLabel.textColor = UIColor.white
            banner.detailLabel.textColor = UIColor.white
            banner.position = .bottom
            banner.didMoveToSuperview()
            banner.show(vc.view, duration: 1.0)
        }else {
            
        }
    }
    
//    func openMenu(_ vc:UIViewController,sender: UIButton?) {
//        if vc.revealViewController() != nil {
//            if sender != nil {
//                sender!.addTarget(vc.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//            }
//            let reveal = SWRevealViewController()
//            reveal.rearViewRevealOverdraw = 30.0
//            reveal.rearViewRevealDisplacement = 160.0
//            vc.revealViewController().rearViewRevealWidth = vc.view.frame.width - 80
//            vc.view.addGestureRecognizer(vc.revealViewController().panGestureRecognizer())
//            vc.view.addGestureRecognizer(vc.revealViewController().tapGestureRecognizer())
//        }
//    }
    
//    func base64StringOfImage(_ image:UIImage) -> String {
//        let imageData = UIImageJPEGRepresentation(image, 0.8)
//        let base64String = imageData!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
//        return base64String
//    }
    
    func noRecordLabel(_ vc: UIViewController,text:String,wantToShow show:Bool) {
        
        if show {
            lebel.numberOfLines = 0
            lebel.textAlignment = .center
            lebel.adjustsFontSizeToFitWidth = true
            lebel.textColor = UIColor.darkGray
            lebel.center = vc.view.center
            lebel.text = text
            vc.view.addSubview(lebel)
        }else {
            lebel.removeFromSuperview()
        }
    }

	func showNoRecordFound(vc: UIViewController) {
		let label = UILabel(frame: CGRect.zero)
		label.text = "No Record Found"
		label.sizeToFit()
		vc.view.addSubview(label)

		let leading = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: vc.view, attribute: .leading, multiplier: 1, constant: 8)
		let trailing = NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: vc.view, attribute: .trailing, multiplier: 1, constant: 8)
		let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: vc.view, attribute: .centerY, multiplier: 1, constant: 0)

		vc.view.addConstraints([leading,trailing,centerY])
	}
}
