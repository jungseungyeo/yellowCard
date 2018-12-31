//
//  MyCardSettingViewController.swift
//  yellowCard
//
//  Created by 여정승 on 30/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class MyCardSettingViewController: RootVC {

    private var myCardSettingView: MyCardSettingView? = nil

    override func setup() {
        super.setup()
        myCardSettingView = MyCardSettingView(frame: self.view.frame)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
