//
//  KSimpleAnimator.swift
//  KAnimator
//
//  Created by kaylla on 2020/9/8.
//  Copyright © 2020 kaylla. All rights reserved.
//

import UIKit

class KSimpleAnimator: NSObject, KAnimator {
    var transitionDuration: TimeInterval = 1
    var presenting: Bool = false
    var delegate: KAnimatorDelegate?
}

extension KSimpleAnimator {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let fromView = fromVC?.view
        
        let toVC = transitionContext.viewController(forKey: .to)
        let toView = toVC?.view
        
        let containerView = transitionContext.containerView
        containerView.addSubview(fromView!)
        containerView.addSubview(toView!)
        
        toView?.alpha = 0
        UIView.animate(withDuration: transitionDuration, animations: {
            fromView?.alpha = 0
            toView?.alpha = 1
        }) { (finished) in
            transitionContext.completeTransition(true)
            self.delegate?.presentCompleteTransition?()
        }
    }
}
