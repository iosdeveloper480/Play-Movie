//
//  WACircleRotatingLoaderView.swift
//  PlayMovie
//
//  Created by Waqas Ali on 05/02/2018.
//  Copyright © 2018 Waqas Ali. All rights reserved.
//
import Foundation
import UIKit

class WACircleRotatingLoaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        let duration:CGFloat = 0.75
        
        //    Scale animation
        let scaleAnimation = self.createKeyframeAnimation(withKeyPath: "transform.scale")
        
        scaleAnimation.values = [NSValue(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)),
        NSValue(caTransform3D: CATransform3DMakeScale(0.6, 0.6, 1.0)),
        NSValue(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0))]
        
//        scaleAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
//        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6f, 0.6f, 1.0f)],
//        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
        scaleAnimation.keyTimes = [0.0, 0.5, 1.0]
        
        // Rotate animation
        let rotateAnimation = self.createKeyframeAnimation(withKeyPath: "transform.rotation.z")
        
        rotateAnimation.values = [0, Double.pi, (2 * Double.pi)]
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        
        // Animation
        let animation = self.createAnimationGroup()
        
        animation.animations = [scaleAnimation, rotateAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.duration = CFTimeInterval(duration)
        animation.repeatCount = 2
        
        // Draw ball clip
        let circle = CAShapeLayer(layer: layer)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius:rect.size.width / 2, startAngle:CGFloat(1.5 * Double.pi), endAngle:CGFloat(Double.pi), clockwise:true)
//        bezierPathWithArcCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:1.5 * M_PI endAngle:M_PI clockwise:true];
        
        circle.path = circlePath.cgPath
        circle.lineWidth = 2
        circle.fillColor = nil
        circle.strokeColor = UIColor.green.cgColor
        
        circle.frame = CGRect(x: (layer.bounds.size.width - rect.size.width) / 2,y: (layer.bounds.size.height - rect.size.height) / 2,width: rect.size.width,height: rect.size.height)
        circle.add(animation, forKey: "animation")
//        circle.add(animation forKey:"animation")
        layer.addSublayer(circle)
    }

    func createKeyframeAnimation(withKeyPath keyPath: String) -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func createAnimationGroup() -> CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        animationGroup.isRemovedOnCompletion = false
        return animationGroup
    }
    
    
//    - (CAAnimationGroup *)createAnimationGroup {
//    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
//    animationGroup.removedOnCompletion = NO;
//    return animationGroup;
//    }
//    - (CAKeyframeAnimation *)createKeyframeAnimationWithKeyPath:(NSString *)keyPath {
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
//    animation.removedOnCompletion = NO;
//    return animation;
//    }

}
