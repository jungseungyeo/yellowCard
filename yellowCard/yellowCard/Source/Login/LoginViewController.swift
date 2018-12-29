//
//  LoginViewController.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import RxCocoa
import RxSwift
import NVActivityIndicatorView

class LoginViewController: RootVC {

    private let loginView = LoginView()

    private let viewModel = LoginViewModel()

    private var indicator: NVActivityIndicatorView? = nil

    static func instance() -> LoginViewController? {
        return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? LoginViewController
    }

    override func setup() {
        super.setup()
        loginView.delegate = self
        self.view = loginView
//        self.indicator = NVIndicatiorView.instance(self)
//        self.indicator?.stopAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func moveMain() {
        present(YellowCardNavigationController.instance()!, animated: true, completion: nil)
    }

}

extension LoginViewController: LoginViewdelegate {
    func kakaoButtonTapped(sender: UITapGestureRecognizer) {
        viewModel.isKakaoLogin(success: { [weak self] in
            self?.moveMain()
        }, failure: { [weak self] error in
            //로그인 에러
            self?.indicator?.startAnimating()
        })
    }
}
