//
//  SettingViewController.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class SettingViewController: RootVC {

    private var settingView: SettingView? = nil

    private let viewModel = SettingViewModel()

    static func instance() -> SettingViewController? {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? SettingViewController
    }

    override func setup() {
        super.setup()
        settingView = SettingView(frame: self.view.frame)
        self.view = settingView
        settingView?.settingCollectionView.delegate = self
        settingView?.settingCollectionView.dataSource = self
        self.settingView?.settingCollectionView.register(SettingCollectionViewCell.self, forCellWithReuseIdentifier: SettingCollectionViewCell.registerId)
//        settingView?.delegate = self
        let title = "설정"
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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setup()
//        self.settingView?.bind(currendVersion: viewModel.currenVersion())
    }
}

extension SettingViewController: settingDelegate {
    func myCardSettingTapped() {
        self.navigationController?.pushViewController(MyCardSettingViewController.instance()!, animated: true)
    }

    func myProfileTapped() {
        self.navigationController?.pushViewController(MyProfileUpdateViewController.instance()!, animated: true)
    }
}

extension SettingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingCollectionViewCell.registerId, for: indexPath) as! SettingCollectionViewCell
        cell.delegate = self
        cell.bind(currendVersion: viewModel.currenVersion())
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = collectionView.frame.height
        if height < 667 { height = 667.0 }
        return CGSize(width: collectionView.frame.width, height: height)
    }
}
