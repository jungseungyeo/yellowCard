//
//  AlcolDringCollectionViewCell.swift
//  yellowCard
//
//  Created by 여정승 on 30/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

class AlcolDringCollectionViewCell: RootCollectionViewCell {

    static let registerId = "AlcolDringCollectionViewCell"

    public let dringAlcolButton = UIButton(type: .system).then {
        $0.setTitle("소주", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.borderWidth = 1
    }

    override func setup() {
        super.setup()
        addSubviews(dringAlcolButton)
    }

    override func setupUI() {
        super.setupUI()

        dringAlcolButton.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    override func setupTapped() {
        super.setupTapped()
    }
}
