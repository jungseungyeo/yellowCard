//
//  RootTableViewCell.swift
//  yellowCard
//
//  Created by 여정승 on 27/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class RootTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

    func setup() { }
    func setupUI() { }
    func setupTapped() { }
}
