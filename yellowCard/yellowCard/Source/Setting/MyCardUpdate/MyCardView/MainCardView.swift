//
//  mainCardView.swift
//  yellowCard
//
//  Created by 여정승 on 14/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import Foundation

class MainCardView: RootView {

    private let title = UILabel(frame: .zero).then {
        $0.text = "메인 주종을 먼저 골라주세요."
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    public var alcolCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.tag = 2
        return collectionView
    }()

    private let border = UIView(frame: .zero).then {
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor(r: 17, g: 17, b: 17).cgColor
        $0.layer.borderWidth = 3
    }

    public let boadView = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCardYellow
    }

    public let firstLabel = UILabel(frame: .zero).then {
        $0.text = "내가 가장 좋아하는 맥주"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 20, weight: .Light)
    }

    public let secondLabel = UILabel(frame: .zero).then {
        $0.text = "2,000cc까지는"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.backgroundColor = .white
        $0.font = .spoqaFont(ofSize: 16, weight: .Light)
    }

    public let thirdLabel = UILabel(frame: .zero).then {
        $0.text = "마실 수 있어요."
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 16, weight: .Light)
    }

    public let inputText = UITextField(frame: .zero).then {
        $0.placeholder = "깔끔하게"
        $0.textAlignment = .left
        $0.backgroundColor = .white
        $0.font = .spoqaFont(ofSize: 16, weight: .Light)
    }

    public let drinkingText = UITextField(frame: .zero).then {
        $0.placeholder = "음료수만마시고도"
        $0.textAlignment = .left
        $0.backgroundColor = .white
        $0.font = .spoqaFont(ofSize: 16, weight: .Light)
        $0.isHidden = true
    }

    public let alcolView = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "beerCopy")
        $0.contentMode = .scaleAspectFit
    }

    public let registerBtn = UIButton(type: .system).then {
        $0.setTitle("등록 완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(r: 221, g: 221, b: 221)
        $0.layer.cornerRadius = 24
        $0.isEnabled = false
    }

    override func setup() {
        super.setup()

        addSubviews(title,
                    alcolCollectionView,
                    boadView,
                    border,
                    firstLabel,
                    secondLabel,
                    thirdLabel,
                    inputText,
                    alcolView,
                    registerBtn,
                    drinkingText)
    }

    override func setupUI() {
        super.setupUI()

        title.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(33)
            make.left.equalToSuperview().offset(30)
        }

        alcolCollectionView.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(17)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(28)
        }

        border.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolCollectionView.snp.bottom).offset(21)
            make.left.equalTo(alcolCollectionView.snp.left).offset(28)
            make.right.equalTo(alcolCollectionView.snp.right).offset(-27)
            make.height.equalTo(self.border.snp.width).offset(0)
        }

        boadView.snp.makeConstraints { make -> Void in
            make.height.equalTo(border.snp.height).offset(0)
            make.width.equalTo(border.snp.width).offset(0)
            make.top.equalTo(border.snp.top).offset(10)
            make.left.equalTo(border.snp.left).offset(9)
        }

        firstLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(border.snp.top).offset(41)
            make.left.equalTo(border.snp.left).offset(37)
        }

        secondLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(firstLabel.snp.bottom).offset(10)
            make.left.equalTo(firstLabel.snp.left).offset(0)
        }

        inputText.snp.makeConstraints { make -> Void in
            make.top.equalTo(secondLabel.snp.top).offset(0)
            make.left.equalTo(secondLabel.snp.right).offset(0)
        }

        thirdLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(secondLabel.snp.bottom).offset(10)
            make.left.equalTo(firstLabel.snp.left).offset(0)
        }

        alcolView.snp.makeConstraints { make -> Void in
            make.width.equalTo(border.snp.width).multipliedBy(0.428125)
            make.height.equalTo(border.snp.height).multipliedBy(0.565625)
            make.right.equalTo(border.snp.right).offset(-27)
            make.bottom.equalTo(border.snp.bottom).offset(-18)
        }

        registerBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(border.snp.bottom).offset(26)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(128)
        }

        drinkingText.snp.makeConstraints { make -> Void in
            make.top.equalTo(firstLabel.snp.bottom).offset(10)
            make.left.equalTo(firstLabel.snp.left).offset(0)
        }
    }

    override func setupTapped() {
        super.setupTapped()
    }
}
