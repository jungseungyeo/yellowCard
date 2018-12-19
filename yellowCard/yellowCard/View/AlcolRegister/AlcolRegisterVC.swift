//
//  AlcolRegisterVC.swift
//  yellowCard
//
//  Created by 여정승 on 19/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

class AlcolRegisterViewController: UIViewController {

    private let alcolRegisterView = AlcoRegisterView()

    static func instance() -> AlcolRegisterViewController? {
        return UIStoryboard(name: "AlcolRegister", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? AlcolRegisterViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = alcolRegisterView
        alcolRegisterView.delegate = self
    }

}

extension AlcolRegisterViewController: AlcoRegisterViewDelegate {
    func dismissButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
