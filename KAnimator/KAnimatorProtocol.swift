//
//  KAnimatorProtocol.swift
//  KAnimator
//
//  Created by kaylla on 2020/9/8.
//  Copyright © 2020 kaylla. All rights reserved.
//

import UIKit

// MARK: - KAnimatorProtocol
protocol KAnimatorProtocol: KAnimatorDelegate, UIViewControllerTransitioningDelegate {
    var animator: KAnimator { get set }
}

@objc protocol KAnimatorDelegate {
    // you can do something when present animation complete
    @objc optional func presentCompleteTransition()
    // you can do something when dismiss animation complete
    @objc optional func dismissCompleteTransition()
}

// MARK: - KAnimator
protocol KAnimator: AnyObject,  UIViewControllerAnimatedTransitioning {
    var transitionDuration: TimeInterval { get set }
    var presenting: Bool { get set }
    var delegate: KAnimatorDelegate? { get set }
}
