//
//  YellowCardMain.swift
//  yellowCard
//
//  Created by 여정승 on 16/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class YellowCardVC: UIViewController {

    private let yellowCardView = YellowCardView()

    static func instance() -> YellowCardVC? {
        return UIStoryboard(name: "YellowCardMain", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? YellowCardVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = yellowCardView
        yellowCardView.mainDetailCardView.register(YellowCardDetailCell.self, forCellWithReuseIdentifier: "YellowCardDetailCell")
        yellowCardView.mainDetailCardView.delegate = self
        yellowCardView.mainDetailCardView.dataSource = self
        yellowCardView.delegate = self
    }
}

extension YellowCardVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YellowCardDetailCell", for: indexPath) as! YellowCardDetailCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension YellowCardVC: YellowCardViewDelegate {
    func alcolRegistrationButtonTapped() {
        print("주량등록 클릭")
        DispatchQueue.main.async {
            self.present(AlcolRegisterViewController.instance()!, animated: true, completion: nil)
        }
    }

    func calendarButtonTapped() {
        print("캘린더 클릭")
    }

    func encyclopediaButtonTapped() {
        print("백과사전 클릭")
    }
}
