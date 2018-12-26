//
//  RootViewController.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation
import UIKit

class RootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    /// 상속 받은 VC에서 viewDidLoad가 호출 되기 전에 실행되는 함수
    func setup() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.navigationBar.barTintColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
}

extension RootVC: UINavigationBarDelegate, UIGestureRecognizerDelegate {

}
