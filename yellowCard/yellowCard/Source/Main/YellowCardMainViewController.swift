//
//  YellowCardMainViewController.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class YellowCardMainViewController: RootVC {

    private let yellowCardMainView = YellowCardMianView()

    static func instance() -> YellowCardMainViewController? {
        return UIStoryboard(name: "YellowCardMain", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? YellowCardMainViewController
    }

    override func setup() {
        super.setup()
        self.yellowCardMainView.delegate = self
        self.view = yellowCardMainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension YellowCardMainViewController: YellowCarMainViewDelegate {
    func settingTapped() {
        self.navigationController?.pushViewController(SettingViewController.instance()!, animated: true)
    }
}
