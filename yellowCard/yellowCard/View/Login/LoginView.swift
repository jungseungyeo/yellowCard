//
//  LoginView.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import GoogleSignIn
import SnapKit
import Then

protocol LoginButtonDelegate {
    func kakaoLoginTapped(view: LoginView)
}

class LoginView: UIView {

    var delegate: LoginButtonDelegate?

    let mainTitle = UILabel().then {
        $0.text = "회원 가입 화면"
        $0.font = .spoqaFont(ofSize: 20, weight: .Regular)
        $0.textColor = .black
    }

    let kakaoLoginButton = KOLoginButton()
    let googleLoginButton = GIDSignInButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        uiSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        uiSetup()
    }

    private func uiSetup() {
        self.backgroundColor = .white

        addSubViews(kakaoLoginButton, googleLoginButton)

        kakaoLoginButton.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(45)
            make.bottom.equalToSuperview().offset(-60)
        }

        googleLoginButton.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(45)
            make.bottom.equalTo(kakaoLoginButton.snp.top).offset(-15)
        }

        tapSetup()
    }

    private func tapSetup() {
        kakaoLoginButton.addTarget(self, action: #selector(kakaoButtonTapped), for: .touchUpInside)
    }

}

extension LoginView {
    @objc
    func kakaoButtonTapped() {
        delegate?.kakaoLoginTapped(view: self)
    }
}
