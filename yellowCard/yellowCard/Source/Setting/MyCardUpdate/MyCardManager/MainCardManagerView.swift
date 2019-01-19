//
//  MainCardManagerView.swift
//  yellowCard
//
//  Created by 여정승 on 19/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import UIKit

class MainCardManagerView: RootView {

    private let title: UILabel = UILabel(frame: .zero).then {
        $0.text = "등록한 카드를 확인 및 관리해세요."
        $0.textColor = UIColor(r: 0, g: 0, b: 0)
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let trash: UIImageView = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "trash")
        $0.contentMode = .scaleAspectFill
    }

    public var mainCardManagerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.tag = 3
        return collectionView
    }()


    override func setup() {
        super.setup()

        addSubviews(title,
                    trash,
                    mainCardManagerCollectionView)
    }

    override func setupUI() {
        super.setupUI()

        title.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(33)
            make.left.equalToSuperview().offset(37)
        }

        trash.snp.makeConstraints { make -> Void in
            make.width.equalTo(12)
            make.height.equalTo(16)

            make.top.equalTo(title.snp.top).offset(2)
            make.right.equalTo(self.snp.right).offset(-40)
        }

        mainCardManagerCollectionView.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }

    }
}
