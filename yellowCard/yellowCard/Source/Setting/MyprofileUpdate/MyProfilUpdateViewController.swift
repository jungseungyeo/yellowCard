//
//  MyProfilUpdateViewController.swift
//  yellowCard
//
//  Created by 여정승 on 28/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class MyProfileUpdateViewController: RootVC {

    private var myprofielView: MyProfileUpdateView? = nil

    static func instance() -> MyProfileUpdateViewController? {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? MyProfileUpdateViewController
    }

    override func setup() {
        super.setup()

        myprofielView = MyProfileUpdateView(frame: self.view.frame)
        myprofielView?.myProfileCollectionView.delegate = self
        myprofielView?.myProfileCollectionView.dataSource = self
        self.myprofielView?.myProfileCollectionView.register(MyProfileUpdateCollectionViewCell.self, forCellWithReuseIdentifier: MyProfileUpdateCollectionViewCell.registerId)
        self.view = myprofielView
        let title = "메인 페이지 수정"
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSMutableAttributedString.Key.font: UIFont.spoqaFont(ofSize: 20, weight: .Bold)]

        let filterInitBarButton = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelBarButtonItemTapped))
        filterInitBarButton.image = UIImage(named: "backBtn.png")
        filterInitBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = filterInitBarButton
    }

    @objc
    private func cancelBarButtonItemTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyProfileUpdateViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyProfileUpdateCollectionViewCell.registerId, for: indexPath) as! MyProfileUpdateCollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
