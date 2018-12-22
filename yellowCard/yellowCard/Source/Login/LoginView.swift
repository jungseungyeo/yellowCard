//
//  LoginView.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

protocol LoginViewdelegate {
    func kakaoButtonTapped(sender: UITapGestureRecognizer)
}

class LoginView: RootView {

    public var delegate: LoginViewdelegate?

    private let firstTitle = UILabel(frame: .zero).then {
        $0.text = "건강한 음주문화를 위한"
        $0.textColor = UIColor.YellowCardInfo.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 18, weight: .Light)
    }

    private let secondTitle = UILabel(frame: .zero).then {
        $0.text = "신개념 주량명함"
        $0.textColor = UIColor.YellowCardInfo.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 18, weight: .Bold)
    }

    private let thirdTitle = UILabel(frame: .zero).then {
        $0.text = "Yellow Card"
        $0.textColor = UIColor.YellowCardInfo.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 36, weight: .Bold)
    }

    private let logoImg = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "loginImg.png")
        $0.contentMode = .scaleAspectFill
    }

    private let kakaoLoginButton = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "kakaolinkImg.png")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }

    private let kakaoTitle = UILabel(frame: .zero).then {
        $0.text = "카카오톡"
        $0.textColor = UIColor.YellowCardInfo.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
    }

    override func setup() {
        super.setup()

        addSubviews(firstTitle,
                    secondTitle,
                    thirdTitle,
                    logoImg,
                    kakaoLoginButton,
                    kakaoTitle)
    }

    override func setupUI() {

        firstTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(132)
            make.centerX.equalToSuperview()
            make.height.equalTo(27)
        }

        secondTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(firstTitle.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.height.equalTo(27)
        }

        thirdTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(secondTitle.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.height.equalTo(43)
        }

        logoImg.snp.makeConstraints { make -> Void in
            make.width.equalTo(213)
            make.height.equalTo(305)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        kakaoLoginButton.snp.makeConstraints { make -> Void in
            make.size.equalTo(50)
            make.left.equalToSuperview().offset(34)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-52)
        }

        kakaoTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(4)
            make.centerX.equalTo(kakaoLoginButton.snp.centerX).offset(0)
        }
    }

    override func setupTapped() {
        super.setupTapped()
        let tap = UITapGestureRecognizer(target: self, action: #selector(kakaoButtonTapped(sender:)))
        kakaoLoginButton.addGestureRecognizer(tap)
    }
}


// MARK: - delegate setup
extension LoginView {

    @objc
    private func kakaoButtonTapped(sender: UITapGestureRecognizer) {
        delegate?.kakaoButtonTapped(sender: sender)
    }

}
