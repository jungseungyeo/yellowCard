//
//  YellowCardMainViewController.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class YellowCardMainViewController: RootVC {

    private var yellowCardMainView: YellowCardMianView? = nil

    static func instance() -> YellowCardMainViewController? {
        return UIStoryboard(name: "YellowCardMain", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? YellowCardMainViewController
    }

    override func setup() {
        super.setup()
//        UserViewModel.shared.userInfo = DemoModelGet.getUserInfoModel
        yellowCardMainView = YellowCardMianView(frame: self.view.frame)

        self.yellowCardMainView?.delegate = self
        self.yellowCardMainView?.cardView.dataSource = self
        self.yellowCardMainView?.cardView.delegate = self
        self.yellowCardMainView?.cardView.register(YellowCardDetailCell.self, forCellWithReuseIdentifier: YellowCardDetailCell.registerId)

        self.yellowCardMainView?.bind(userInfo: UserViewModel.shared.userInfo)
        self.view = yellowCardMainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension YellowCardMainViewController: YellowCarMainViewDelegate {

    func settingTapped() {
        self.navigationController?.pushViewController(SettingViewController.instance()!, animated: true)
    }

    func alcolRegisterTapped() {
        self.navigationController?.pushViewController(AlcolRegisterViewController.instance()!, animated: true)
    }

    func calendarTapped() {

    }

    func encyclopediaTapped() {
        self.navigationController?.pushViewController(EncyclopediaViewController.instance()!, animated: true)
    }
}

extension YellowCardMainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserViewModel.shared.userInfo?.cardModel?.count ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YellowCardDetailCell.registerId, for: indexPath) as! YellowCardDetailCell

        cell.bind(cardModel: UserViewModel.shared.userInfo?.cardModel?[indexPath.row])
//        cell.bind(cardModel: nil)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x

        UIView.animate(withDuration: 0.3, animations: {
            self.yellowCardMainView?.pageCount.currentPage = Int(x / self.view.frame.width)
            self.yellowCardMainView?.layoutIfNeeded()
        })
    }

}
