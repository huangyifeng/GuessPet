//
//  FlipPresentAnimationController.swift
//  GuessPet
//
//  Created by huang yifeng on 16/11/20.
//  Copyright © 2016年 cybozu. All rights reserved.
//

import UIKit

class FlipPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originFrame = CGRect.zero
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0;
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toController = transitionContext.viewController(forKey: .to),
            let contaionerView:UIView = transitionContext.containerView,
            let fromController = transitionContext.viewController(forKey: .from)
        else {
            return
        }
        
        let initailFrame = self.originFrame
        let finalFrame = transitionContext.finalFrame(for: toController)
        
        let snapshot:UIView! = toController.view.snapshotView(afterScreenUpdates: true)
        snapshot.frame = initailFrame
        snapshot.layer.cornerRadius = 25
        snapshot.layer.masksToBounds = true
        
        AnimationHelper.perspectiveTransformForContainerView(contaionerView)
        snapshot.layer.transform = AnimationHelper.yRotation(-M_PI_2)
        
        toController.view.isHidden = true
        contaionerView.addSubview(toController.view)
        contaionerView.addSubview(snapshot)
        
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animateKeyframes(withDuration: duration,
                                delay: 0,
                                options: .calculationModeCubic,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: { 
                                        fromController.view.layer.transform = AnimationHelper.yRotation(M_PI_2)
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                                        snapshot.layer.transform = AnimationHelper.yRotation(0)
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                                        snapshot.frame = finalFrame
                                    })
        }, completion: {_ in
            toController.view.isHidden = false
            fromController.view.layer.transform = CATransform3DIdentity
            snapshot.removeFromSuperview()
            transitionContext.completeTransition(true)
        })

    }


}
