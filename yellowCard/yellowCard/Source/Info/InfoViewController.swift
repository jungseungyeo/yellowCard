//
//  InfoViewController.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class InfoViewController: RootVC {

    private let infoView = InfoView()

    private var timer: Timer? = nil

    static func instance() -> InfoViewController? {
        return  UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? InfoViewController
    }

    override func setup() {
        super.setup()
        self.view = infoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveNext), userInfo: [], repeats: false)
    }

    @objc
    private func moveNext() {
        timer?.invalidate()
        timer = nil
        self.dismiss(animated: false, completion: {
            UIApplication.shared.keyWindow?.rootViewController = LoginViewController.instance()!
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
        })
    }
}
