//
//  LoginViewController.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()

    static func instance() -> LoginViewController? {
        return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? LoginViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        self.view = loginView
    }
}

extension LoginViewController: LoginButtonDelegate {

    func kakaoLoginTapped(view: LoginView) {
        guard let session = KOSession.shared() else {
            return
        }

        guard !session.isOpen() else {
            session.close()
            return
        }
        UserInfoViewModel.shared.kakaoLogin(session: session, complete: { result in
            guard result else {
                // 실패
                return
            }
            // 성공
            print("카카오 로그인 성공")
        })

    }

    func logoutKakao(session: KOSession) {
        session.logoutAndClose(completionHandler: { success, error in
            if success {
                session.close()
            }
        })
    }
}
