//
//  ViewController.swift
//  yellowCard
//
//  Created by 여정승 on 12/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.moveInfo()
//            self.moveYellowCardMain()
//            self.moveAlcolRegister()
        }
    }

    private func moveInfo() {
        if let infoView = InfoViewController.instance() {
            present(infoView, animated: true, completion: nil)
        }
    }

    private func moveLogin() {
        if let loginView = LoginViewController.instance() {
            present(loginView, animated: true, completion: nil)
        }
    }

    private func moveYellowCardMain() {
        if let mainVC = YellowCardVC.instance() {
            present(mainVC, animated: true, completion: nil)
        }
    }

    private func moveAlcolRegister() {
        if let alcolview = AlcolRegisterViewController.instance() {
            present(alcolview, animated: true, completion: nil)
        }
    }
}
