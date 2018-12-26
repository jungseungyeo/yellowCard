//
//  RootScrollView.swift
//  yellowCard
//
//  Created by 여정승 on 25/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class RootScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupUI()
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
    func setupUI() { }
    func setupTapped() { }
}
