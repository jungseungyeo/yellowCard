//
//  EncyclopediaTableCell.swift
//  yellowCard
//
//  Created by 여정승 on 31/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class EncyclopediaTableCell: RootTableViewCell {

    static let registerId = "EncyclopediaTableCell"

    public var filterButton = UIButton(type: .system).then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.black.cgColor
        $0.clipsToBounds = true
        $0.titleLabel?.font = .spoqaFont(ofSize: 11, weight: .Light)
        $0.contentMode = .center
        $0.setTitleColor(.white, for: .normal)
    }

    override func setup() {
        super.setup()

        addSubviews(filterButton)
    }

    override func setupUI() {
        super.setupUI()

        filterButton.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
