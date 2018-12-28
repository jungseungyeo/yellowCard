//
//  MyProfilUpdateViewController.swift
//  yellowCard
//
//  Created by 여정승 on 28/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class MyProfileUpdateViewController: RootVC {

    static func instance() -> MyProfileUpdateViewController? {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? MyProfileUpdateViewController
    }

    override func setup() {
        super.setup()

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
