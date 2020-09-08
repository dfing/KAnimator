//
//  KViewControllerA.swift
//  KAnimator
//
//  Created by kaylla on 2020/9/8.
//  Copyright © 2020 kaylla. All rights reserved.
//

import UIKit

class KViewControllerA: UIViewController {
    lazy var toBtn: UIButton = {
        let btnWidth: CGFloat = 150
        let btn = UIButton()
        btn.setTitle("PUSH", for: .normal)
        btn.frame = CGRect(x: (self.view.frame.width - btnWidth)/2,
                           y: 100,
                           width: btnWidth,
                           height: 40)
        btn.addTarget(self, action: #selector(btnTouchUpInside(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
    }

    func setupSelf() {
        view.backgroundColor = .orange
        view.addSubview(toBtn)
    }
    
    @objc func btnTouchUpInside(_ sender: UIButton) {
        let vc = KViewControllerC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
