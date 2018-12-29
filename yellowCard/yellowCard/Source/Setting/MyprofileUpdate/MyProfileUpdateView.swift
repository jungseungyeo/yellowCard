//
//  MyProfileUpdateView.swift
//  yellowCard
//
//  Created by 여정승 on 28/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class MyProfileUpdateView: RootView {

    public var myProfileCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func setup() {
        super.setup()

        addSubviews(myProfileCollectionView)
    }

    override func setupUI() {
        super.setupUI()

        myProfileCollectionView.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
