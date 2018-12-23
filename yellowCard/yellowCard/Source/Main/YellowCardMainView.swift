//
//  YellowCardMainView.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

protocol YellowCarMainViewDelegate {
    func settingTapped()
}

class YellowCardMianView: RootView {

//    private let title = UILabel().then {
//        $0.text = "YellowCard"
//        $0.font = .spoqaFont(ofSize: 20, weight: .Bold)
//        $0.textColor = .black
//    }
//
//    private let settingBtn = UIButton().then {
//        $0.setTitle("환경설정", for: .normal)
//        $0.titleLabel?.font = .spoqaFont(ofSize: 12, weight: .Light)
//        $0.setTitleColor(UIColor.YellowCardBorderColor, for: .normal)
//    }
//
//    var mainDetailCardView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.isPagingEnabled = true
//        collectionView.backgroundColor = .white
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()

    var delegate: YellowCarMainViewDelegate?

    private let title = UILabel(frame: .zero).then {
        $0.text = "Yellow Card"
        $0.textColor = UIColor.YellowCardBlack
        $0.font = .spoqaFont(ofSize: 20, weight: .Bold)
    }

    private let settingImg = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "combinedShapeCopy.png")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    private let settingTitle = UIButton(frame: .zero).then {
        $0.setTitle("환경 설정", for: .normal)
        $0.setTitleColor(UIColor.YellowCardBorderColor, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    override func setup() {
        super.setup()

        addSubviews(title,
                    settingImg,
                    settingTitle)
    }

    override func setupUI() {
        super.setupUI()

        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.left.equalToSuperview().offset(33)
            make.height.equalTo(24)
        }

        settingTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(36.5)
            make.right.equalTo(-43)
            make.height.equalTo(18)
        }

        settingImg.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(settingTitle.snp.centerY).offset(0)
            make.right.equalTo(settingTitle.snp.left).offset(-4)
            make.size.equalTo(14)
        }
    }

    override func setupTapped() {
        super.setupTapped()

        settingTitle.addTarget(self, action: #selector(settingTapped), for: .touchUpInside)
    }
}

extension YellowCardMianView {

    @objc
    private func settingTapped() {
        delegate?.settingTapped()
    }
}
