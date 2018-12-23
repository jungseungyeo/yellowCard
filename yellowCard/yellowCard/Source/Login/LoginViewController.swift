//
//  LoginViewController.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import RxCocoa
import RxSwift

class LoginViewController: RootVC {

    private let loginView = LoginView()

    private let viewModel = LoginViewModel()

    static func instance() -> LoginViewController? {
        return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? LoginViewController
    }

    override func setup() {
        super.setup()
        loginView.delegate = self
        self.view = loginView
        
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
        }, failure: { error in
            //로그인 에러
        })
    }
}
