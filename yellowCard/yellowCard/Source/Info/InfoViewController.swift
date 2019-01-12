//
//  InfoViewController.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class InfoViewController: RootVC {

    private let infoView = InfoView()

    private let viewModel = InfoViewModel()

    private var timer: Timer? = nil

    public var indicator: NVActivityIndicatorView? = nil

    static func instance() -> InfoViewController? {
        return  UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? InfoViewController
    }

    override func setup() {
        super.setup()
        self.view = infoView
        indicator = NVIndicatiorView.instance(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveNext), userInfo: [], repeats: false)
    }

    @objc
    private func moveNext() {
        timer?.invalidate()
        timer = nil

        guard let token = UserDefaults.standard.value(forKey: "token") as? String else {
            self.dismiss(animated: false, completion: {
                UIApplication.shared.keyWindow?.rootViewController = LoginViewController.instance()!
                UIApplication.shared.keyWindow?.makeKeyAndVisible()
            })
            return
        }
        requestMainData(token: token)
    }

    private func requestMainData(token: String) {
        viewModel.requestMain(view: self, token: token, success: {
            self.dismiss(animated: false, completion: {
                UIApplication.shared.keyWindow?.rootViewController = YellowCardNavigationController.instance()!
                UIApplication.shared.keyWindow?.makeKeyAndVisible()
            })
        }, failure: { error in
            self.dismiss(animated: false, completion: {
                UIApplication.shared.keyWindow?.rootViewController = LoginViewController.instance()!
                UIApplication.shared.keyWindow?.makeKeyAndVisible()
            })
        })
    }
}
