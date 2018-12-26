//
//  AlcolRegisterViewController.swift
//  yellowCard
//
//  Created by 여정승 on 24/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

class AlcolRegisterViewController: RootVC {

    private var alcolView: AlcolRegisterView? = nil

    static func instance() -> AlcolRegisterViewController? {
        return UIStoryboard(name: "AlcolRegister", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? AlcolRegisterViewController
    }

    override func setup() {
        super.setup()
        setupNavibar()

        alcolView = AlcolRegisterView(frame: self.view.frame)
        self.view = alcolView
    }

    private func setupNavibar() {

        let title = "주량 등록"
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSMutableAttributedString.Key.font: UIFont.spoqaFont(ofSize: 20, weight: .Bold)]

        let filterInitBarButton = UIBarButtonItem(title: "취소", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelBarButtonItemTapped))
        filterInitBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = filterInitBarButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    @objc
    private func cancelBarButtonItemTapped() {
        navigationController?.popViewController(animated: true)
    }
}
