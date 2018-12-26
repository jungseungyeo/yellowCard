//
//  SettingViewController.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class SettingViewController: RootVC {

    static func instance() -> SettingViewController? {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? SettingViewController
    }

    override func setup() {
        super.setup()
        self.navigationItem.title = "설정"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setup()
    }
}
