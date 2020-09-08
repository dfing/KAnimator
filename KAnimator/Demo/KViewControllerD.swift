//
//  KViewControllerD.swift
//  KAnimator
//
//  Created by kaylla on 2020/9/8.
//  Copyright © 2020 kaylla. All rights reserved.
//

import UIKit

class KViewControllerD: UIViewController, KAnimatorProtocol {
    var animator: KAnimator
    
    lazy var closeBtn: UIButton = {
        let btnWidth: CGFloat = 150
        let btn = UIButton()
        btn.setTitle("Close", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.frame = CGRect(x: (self.view.frame.width - btnWidth)/2,
                           y: 100,
                           width: btnWidth,
                           height: 40)
        btn.addTarget(self, action: #selector(btnTouchUpInside(_:)), for: .touchUpInside)
        return btn
    }()
    
    init() {
        animator = KSimpleAnimator()
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
        transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
    }

    func setupSelf() {
        view.backgroundColor = .yellow
        view.addSubview(closeBtn)
    }
    
    @objc func btnTouchUpInside(_ sender: UIButton) {
        if navigationController == nil {
            dismiss(animated: true, completion: nil)
        } else {
            if navigationController?.presentingViewController == nil {
                navigationController?.popViewController(animated: true)
            } else {
                navigationController?.dismiss(animated: true, completion: nil)
            }
            
        }
    }
}

extension KViewControllerD {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}
