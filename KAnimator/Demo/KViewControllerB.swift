//
//  KViewControllerB.swift
//  KAnimator
//
//  Created by kaylla on 2020/9/8.
//  Copyright © 2020 kaylla. All rights reserved.
//

import UIKit

class KViewControllerB: UIViewController {

    lazy var toBtn: UIButton = {
        let btnWidth: CGFloat = 150
        let btn = UIButton()
        btn.setTitle("Present", for: .normal)
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
        view.backgroundColor = .red
        view.addSubview(toBtn)
    }
    
    @objc func btnTouchUpInside(_ sender: UIButton) {
        let vc = KViewControllerD()
        present(vc, animated: true, completion: nil)
    }
}
