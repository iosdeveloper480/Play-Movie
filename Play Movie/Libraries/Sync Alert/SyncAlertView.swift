//
//  SyncAlertView.swift
//  PlayMovie
//
//  Created by Waqas Ali on 05/02/2018.
//  Copyright © 2018 Waqas Ali. All rights reserved.
//

import UIKit

class SyncAlertView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var indicator: WACircleRotatingLoaderView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var reportLabel: UILabel!
    @IBOutlet weak var button: WAButton!
    
    var nibName = "SyncAlertView"
    var view: UIView!
    
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
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func showLoadingView(_ vc: UIViewController) {
        var frame = self.frame
        frame.size.width = 130
        frame.size.height = 50
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
