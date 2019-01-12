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

    public var indicator: NVActivityIndicatorView? = nil

    static func instance() -> LoginViewController? {
        return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? LoginViewController
    }

    override func setup() {
        super.setup()
        loginView.delegate = self
        self.view = loginView
        indicator = NVIndicatiorView.instance(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    public func moveMain() {
        present(YellowCardNavigationController.instance()!, animated: true, completion: nil)
    }

}

extension LoginViewController: LoginViewdelegate {
    func kakaoButtonTapped(sender: UITapGestureRecognizer) {
        self.loginView.kakaoLoginButton.isUserInteractionEnabled = false
        viewModel.isKakaoLogin(view: self, success: { [weak self] in
            self?.nextApi()
        }, failure: { [weak self] error in
            self?.loginView.kakaoLoginButton.isUserInteractionEnabled = true
        })
    }

    private func nextApi() {
        
    }
}
