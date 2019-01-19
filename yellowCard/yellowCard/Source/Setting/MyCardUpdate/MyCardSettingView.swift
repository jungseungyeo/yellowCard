//
//  MyCardSettingView.swift
//  yellowCard
//
//  Created by 여정승 on 13/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import Foundation

class MyCardSettingView: RootView {

    public var myCardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = .white
        collectionView.tag = 1
        return collectionView
    }()

    override func setup() {
        super.setup()

        addSubviews(myCardCollectionView)
    }

    override func setupUI() {
        super.setupUI()

        myCardCollectionView.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
