//
//  ViewController.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
//            self.moveInfo()
//            self.moveLogin()
            self.moveMain()
        }
    }
}


// MARK: - Move ViewController
extension ViewController {
    private func moveInfo() {
        if let infoViewController = InfoViewController.instance() {
            present(infoViewController, animated: true, completion: nil)
        }
    }

    private func moveLogin() {
        if let loginViewController = LoginViewController.instance() {
            present(loginViewController, animated: true, completion: nil)
        }
    }

    private func moveMain() {
        if let mainNavigationViewController = YellowCardNavigationController.instance() {
            present(mainNavigationViewController, animated: true, completion: nil)
        }
    }
}

