//
//  InfoViewController.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    private var timer = Timer()
    lazy private var autoSearchTimer = Timer()
    static func instance() -> InfoViewController? {
        return UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? InfoViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        next()
    }

    private func next() {
        UIApplication.shared.keyWindow?.rootViewController = LoginViewController.instance()
    }
    
}
