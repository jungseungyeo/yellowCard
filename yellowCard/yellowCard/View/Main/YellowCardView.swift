//
//  YellowCardView.swift
//  yellowCard
//
//  Created by 여정승 on 16/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

class YellowCardView: UIView {

    private let title = UILabel().then {
        $0.text = "YellowCard"
        $0.font = .spoqaFont(ofSize: 20, weight: .Bold)
        $0.textColor = .black
    }

    private let settingBtn = UIButton().then {
        $0.setTitle("환경설정", for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 12, weight: .Light)
        $0.setTitleColor(UIColor.YellowCard.black, for: .normal)
    }

    var mainDetailCardView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {

        self.backgroundColor = .white

        addSubViews(title,
                    settingBtn,
                    mainDetailCardView
        )

        title.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(16.5)
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(29)
            } else {
                make.top.equalTo(10).offset(29)
            }
        }

        settingBtn.snp.makeConstraints { make -> Void in
            make.right.equalToSuperview().offset(-21.5)
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(34)
            } else {
                make.top.equalTo(10).offset(34)
            }
        }

        mainDetailCardView.snp.makeConstraints { make -> Void in
            make.top.equalTo(settingBtn.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.width.equalTo(mainDetailCardView.snp.height).offset(0)
        }
    }
}
