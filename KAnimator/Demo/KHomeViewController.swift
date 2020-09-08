//
//  KHomeViewController.swift
//  KAnimator
//
//  Created by kaylla on 2020/9/8.
//  Copyright © 2020 kaylla. All rights reserved.
//

import UIKit

class KHomeViewController: UITabBarController, KAnimatorProtocol {
    var animator: KAnimator
    
    init() {
        animator = KSimpleAnimator()
        super.init(nibName: nil, bundle: nil)
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func setupSelf() {
        let vcA = KViewControllerA()
        let vcB = KViewControllerB()
        let nav = UINavigationController(rootViewController: vcA)
        nav.delegate = self
        
        let itemA = UITabBarItem()
        itemA.title = "vcA"
        
        let itemB = UITabBarItem()
        itemB.title = "vcB"
        
        nav.tabBarItem = itemA
//        vcA.tabBarItem = itemA
        vcB.tabBarItem = itemB
        viewControllers = [nav, vcB]
    }
}

extension KHomeViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          animationControllerForTransitionFrom fromVC: UIViewController,
                          to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}

extension KHomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}
