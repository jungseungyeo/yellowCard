//
//  EncyclopediaTableViewCell.swift
//  yellowCard
//
//  Created by 여정승 on 30/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class EncyclopediaCollectionViewCell: RootCollectionViewCell {

    static let registerId = "EncyclopediaCollectionViewCell"

    private let border = UIView(frame: .zero).then {
        $0.layer.cornerRadius = 14
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
    }

    public let alcolImg = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "beerCopy.png")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 14
        $0.layer.borderWidth = 0.1
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }

    public var title = UILabel(frame: .zero).then {
        $0.text = ""
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    public var detailTitle = UILabel(frame: .zero).then {
        $0.text = ""
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 10, weight: .Light)
    }

    //도수
    private var proofTitle = UILabel(frame: .zero).then {
        $0.text = "도수: "
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 10, weight: .Bold)
    }

    public var proof = UILabel(frame: .zero).then {
        $0.text = "0.0"
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 10, weight: .Light)
    }

    private var priceTitle = UILabel(frame: .zero).then {
        $0.text = "가격: "
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 10, weight: .Bold)
    }

    public var price = UILabel(frame: .zero).then {
        $0.text = "1,000원"
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 10, weight: .Light)
    }

    public var likeButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor.white
    }

    public var likeImge = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "oval6.png")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }

    public var likeNumber = UILabel(frame: .zero).then {
        $0.text = "0"
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 10, weight: .Light)
    }

    override func setup() {
        super.setup()

        addSubviews(border,
                    alcolImg,
                    title,
                    detailTitle,
                    proofTitle,
                    proof,
                    priceTitle,
                    price,
                    likeButton)

        likeButton.addSubviews(likeImge,
                               likeNumber)
    }

    override func setupUI() {
        super.setupUI()

        border.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.snp.top).offset(0)
            make.left.equalTo(self.snp.left).offset(0)
            make.right.equalTo(self.snp.right).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(0)
        }

        alcolImg.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(18)
            make.left.equalToSuperview().offset(14)
            make.bottom.equalToSuperview().offset(-18)
            make.width.equalTo(90.4)
        }

        title.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(17)
            make.left.equalTo(alcolImg.snp.right).offset(14.6)
            make.right.equalToSuperview().offset(-28)
        }

        proofTitle.snp.makeConstraints { make -> Void in
            make.left.equalTo(alcolImg.snp.right).offset(14.6)
            make.bottom.equalToSuperview().offset(-16)
        }

        proof.snp.makeConstraints { make -> Void in
            make.left.equalTo(proofTitle.snp.right).offset(3)
            make.centerY.equalTo(proofTitle.snp.centerY).offset(0)
        }

        priceTitle.snp.makeConstraints { make -> Void in
            make.left.equalTo(proof.snp.right).offset(3)
            make.centerY.equalTo(proofTitle.snp.centerY).offset(0)
        }

        price.snp.makeConstraints { make -> Void in
            make.left.equalTo(priceTitle.snp.right).offset(3)
            make.centerY.equalTo(proofTitle.snp.centerY).offset(0)
        }

        detailTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(6)
            make.left.equalTo(title.snp.left).offset(0)
            make.right.equalToSuperview().offset(-29.1)
        }

        likeButton.snp.makeConstraints { make -> Void in
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(15)
            make.width.equalTo(35)
            make.centerY.equalTo(proofTitle.snp.centerY).offset(0)

        }

        likeImge.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(proofTitle.snp.centerY).offset(0)
            make.size.equalTo(10)
            make.left.equalToSuperview()
        }

        likeNumber.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(proofTitle.snp.centerY).offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(20)
        }
    }
}
