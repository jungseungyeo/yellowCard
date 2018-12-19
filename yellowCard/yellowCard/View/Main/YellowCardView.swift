//
//  YellowCardView.swift
//  yellowCard
//
//  Created by 여정승 on 16/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then

protocol YellowCardViewDelegate {
    func alcolRegistrationButtonTapped()
    func calendarButtonTapped()
    func encyclopediaButtonTapped()
}

class YellowCardView: UIView {

    var delegate: YellowCardViewDelegate?

    private let title = UILabel().then {
        $0.text = "YellowCard"
        $0.font = .spoqaFont(ofSize: 20, weight: .Bold)
        $0.textColor = .black
    }

    private let settingBtn = UIButton().then {
        $0.setTitle("환경설정", for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 12, weight: .Light)
        $0.setTitleColor(UIColor.YellowCard.black, for: .normal)
    }

    var mainDetailCardView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private let profileImageView = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "splash.png")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.YellowCard.black.cgColor
        $0.layer.cornerRadius = 56
    }

    private let nickName = UILabel(frame: .zero).then {
        $0.text = "유우미"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 20, weight: .Bold)
    }

    private let alcolMainTitle = UILabel(frame: .zero).then {
        $0.text = "맥주는 역시 튀긴감자랑 함께 해야지"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
    }

    private let alcolRegistrationButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "splash.png"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1.4
        $0.layer.borderColor = UIColor.YellowCard.black.cgColor
        $0.layer.cornerRadius = 26.5
    }

    private let calendarButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "splash.png"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1.4
        $0.layer.borderColor = UIColor.YellowCard.black.cgColor
        $0.layer.cornerRadius = 26.5
    }

    private let encyclopediaButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "splash.png"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1.4
        $0.layer.borderColor = UIColor.YellowCard.black.cgColor
        $0.layer.cornerRadius = 26.5
    }

    private let alcolRegistrationTitle = UILabel(frame: .zero).then {
        $0.text = "주량등록"
        $0.textColor = UIColor.YellowCard.black
        $0.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    private let calendarTitle = UILabel(frame: .zero).then {
        $0.text = "캘린더"
        $0.textColor = UIColor.YellowCard.black
        $0.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    private let encyclopediaTitle = UILabel(frame: .zero).then {
        $0.text = "백과사전"
        $0.textColor = UIColor.YellowCard.black
        $0.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {

        self.backgroundColor = .white

        addSubViews(title,
                    settingBtn,
                    mainDetailCardView,
                    profileImageView,
                    nickName,
                    alcolMainTitle,
                    alcolRegistrationButton,
                    calendarButton,
                    encyclopediaButton,
                    alcolRegistrationTitle,
                    calendarTitle,
                    encyclopediaTitle
        )

        title.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(33)
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(29)
            } else {
                make.top.equalTo(10).offset(29)
            }
        }

        settingBtn.snp.makeConstraints { make -> Void in
            make.right.equalToSuperview().offset(-43)
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(34)
            } else {
                make.top.equalTo(10).offset(34)
            }
        }

        mainDetailCardView.snp.makeConstraints { make -> Void in
            make.top.equalTo(settingBtn.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(mainDetailCardView.snp.width).offset(-40)
        }

        profileImageView.snp.makeConstraints { make -> Void in
            make.size.equalTo(112)
            make.left.equalTo(mainDetailCardView.snp.left).offset(52)
            make.bottom.equalTo(mainDetailCardView.snp.bottom).offset(56)
        }

        nickName.snp.makeConstraints { make -> Void in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.left.equalTo(profileImageView.snp.left).offset(12)
        }

        alcolMainTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(nickName.snp.bottom).offset(3)
            make.left.equalTo(nickName.snp.left).offset(0)
        }

        alcolRegistrationButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolMainTitle.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(68)
            make.size.equalTo(53)
        }

        calendarButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolRegistrationButton.snp.top).offset(0)
            make.centerX.equalToSuperview()
            make.size.equalTo(53)
        }

        encyclopediaButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolRegistrationButton.snp.top).offset(0)
            make.right.equalToSuperview().offset(-68)
             make.size.equalTo(53)
        }

        alcolRegistrationTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(encyclopediaButton.snp.bottom).offset(4)
            make.centerX.equalTo(alcolRegistrationButton.snp.centerX).offset(0)
        }

        calendarTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolRegistrationTitle.snp.top).offset(0)
            make.centerX.equalTo(calendarButton.snp.centerX).offset(0)
        }

        encyclopediaTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolRegistrationTitle.snp.top).offset(0)
            make.centerX.equalTo(encyclopediaButton.snp.centerX).offset(0)
        }

        setupTouch()
    }

    private func setupTouch() {
        alcolRegistrationButton.addTarget(self, action: #selector(alcolRegistrationButtonTapped), for: .touchUpInside)
        calendarButton.addTarget(self, action: #selector(calendarButtonTapped), for: .touchUpInside)
        encyclopediaButton.addTarget(self, action: #selector(encyclopediaButtonTapped), for: .touchUpInside)
    }

    @objc
    private func alcolRegistrationButtonTapped() {
        delegate?.alcolRegistrationButtonTapped()
    }

    @objc
    private func calendarButtonTapped() {
        delegate?.calendarButtonTapped()
    }

    @objc
    private func encyclopediaButtonTapped() {
        delegate?.encyclopediaButtonTapped()
    }
}
