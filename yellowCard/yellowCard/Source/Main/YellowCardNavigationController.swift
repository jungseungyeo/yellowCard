//
//  YellowCardNavigationController.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

class YellowCardNavigationController: RootNavigationController {

    static func instance() -> YellowCardNavigationController? {
        return UIStoryboard(name: "YellowCardMain", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? YellowCardNavigationController
    }

    override func setup() {
        super.setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
