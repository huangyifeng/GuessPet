//
//  AnimationHelper.swift
//  GuessPet
//
//  Created by huang yifeng on 16/11/20.
//  Copyright © 2016年 cybozu. All rights reserved.
//

import UIKit

class AnimationHelper: NSObject {

    static func yRotation(_ angle: Double) -> CATransform3D
    {
        return CATransform3DMakeRotation(CGFloat(angle), 0, 1, 0)
    }
    
    static func perspectiveTransformForContainerView(_ containerView: UIView ) -> Void
    {
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        containerView.layer.sublayerTransform = transform
    }
}
