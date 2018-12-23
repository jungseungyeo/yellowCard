//
//  YellowCardMainViewController.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class YellowCardMainViewController: RootVC {

    static func instance() -> YellowCardMainViewController? {
        return UIStoryboard(name: "YellowCardMain", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? YellowCardMainViewController
    }

    override func setup() {
        super.setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
