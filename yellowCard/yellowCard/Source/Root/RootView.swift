//
//  RootView.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class RootView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupUI()
        setupTapped()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setupUI()
        setupTapped()
    }

    func setup() {
        self.backgroundColor = .white
    }

    func setupUI() {

    }

    func setupTapped() {

    }
}
