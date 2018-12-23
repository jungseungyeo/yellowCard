//
//  YellowCardDetailCell.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class YellowCardDetailCell: RootCollectionViewCell {

    static let registerId = "YellowCardDetailCell"

    private let title = UILabel(frame: .zero).then {
        $0.text = "내가 가장 좋아하는 %@"
        $0.font = .spoqaFont(ofSize: 20, weight: .Light)
    }

    private let mainTitle = UILabel(frame: .zero).then {
        $0.text = "%@잔까지는 깜끔하게"
        $0.font = .spoqaFont(ofSize: 20, weight: .Light)
        $0.backgroundColor = .white
    }

    private let endTitle = UILabel(frame: .zero).then {
        $0.text = "마실 수 있어요."
        $0.font = .spoqaFont(ofSize: 20, weight: .Light)
    }

    private let border = UIView(frame: .zero).then {
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.cornerRadius = 7
    }

    private let background = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCardYellow
    }

    override func setup() {
        super.setup()

        addSubviews(background
            ,border
            ,title
            ,mainTitle
            ,endTitle)
    }

    override func setupUI() {
        super.setupUI()

        border.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-27)
            make.height.equalTo(border.snp.width).offset(0)
        }

        background.snp.makeConstraints { make -> Void in
            make.top.equalTo(border.snp.top).offset(10)
            make.left.equalTo(border.snp.left).offset(9)
            make.size.equalTo(border.snp.size).offset(0)
        }

        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(border.snp.top).offset(41)
            make.left.equalTo(border.snp.left).offset(37)
        }

        mainTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(12)
            make.left.equalTo(title.snp.left).offset(0)
        }

        endTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(mainTitle.snp.bottom).offset(12)
            make.left.equalTo(title.snp.left).offset(0)
        }
    }

    
}
