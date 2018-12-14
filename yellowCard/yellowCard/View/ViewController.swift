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
}
