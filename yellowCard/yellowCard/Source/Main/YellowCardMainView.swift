//
//  YellowCardMainView.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import Kingfisher

protocol YellowCarMainViewDelegate {
    func settingTapped()
    func alcolRegisterTapped()
    func calendarTapped()
    func encyclopediaTapped()
}

class YellowCardMianView: RootView {

    var delegate: YellowCarMainViewDelegate?

    private let title = UILabel(frame: .zero).then {
        $0.text = "Yellow Card"
        $0.textColor = UIColor.YellowCardBlack
        $0.font = .spoqaFont(ofSize: 20, weight: .Bold)
    }

    private let settingImg = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "combinedShapeCopy.png")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    private let settingTitle = UIButton(type: .system).then {
        $0.setTitle("환경 설정", for: .normal)
        $0.setTitleColor(UIColor.YellowCardBorderColor, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    public var cardView: UICollectionView = {
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

    public var pageCount: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor.YellowPageCountSelectColor
        pc.pageIndicatorTintColor = UIColor(patternImage: UIImage(named: "oval6.png")!)
        pc.isHidden = true
        return pc
    }()

    private let profileImageView = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "splash.png")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
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
        $0.setImage(UIImage(named: "register.png"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1.4
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.cornerRadius = 26.5
    }

    private let calendarButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "calendar.png"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1.4
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.cornerRadius = 26.5
    }

    private let encyclopediaButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "encyclopedia.png"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1.4
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.cornerRadius = 26.5
    }

    private let alcolRegistrationTitle = UILabel(frame: .zero).then {
        $0.text = "주량등록"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    private let calendarTitle = UILabel(frame: .zero).then {
        $0.text = "캘린더"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    private let encyclopediaTitle = UILabel(frame: .zero).then {
        $0.text = "백과사전"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.font = .spoqaFont(ofSize: 12, weight: .Light)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setup() {
        super.setup()

        addSubviews(title,
                    settingImg,
                    settingTitle,
                    cardView,
                    pageCount,
                    profileImageView,
                    nickName,
                    alcolMainTitle,
                    alcolRegistrationButton,
                    calendarButton,
                    encyclopediaButton,
                    alcolRegistrationTitle,
                    calendarTitle,
                    encyclopediaTitle)
    }

    override func setupUI() {
        super.setupUI()

        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.left.equalToSuperview().offset(33)
            make.height.equalTo(24)
        }

        settingTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(36.5)
            make.right.equalTo(-43)
            make.height.equalTo(18)
        }

        settingImg.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(settingTitle.snp.centerY).offset(0)
            make.right.equalTo(settingTitle.snp.left).offset(-4)
            make.size.equalTo(14)
        }

        cardView.snp.makeConstraints { make -> Void in
            make.top.equalTo(settingTitle.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(cardView.snp.width).offset(-40)
        }

        pageCount.snp.makeConstraints { make -> Void in
            make.top.equalTo(cardView.snp.bottom).offset(12)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(8)
            make.width.equalTo(36)
        }

        profileImageView.snp.makeConstraints { make -> Void in
            make.size.equalTo(112)
            make.left.equalTo(cardView.snp.left).offset(52)
            make.bottom.equalTo(cardView.snp.bottom).offset(46)
        }

        nickName.snp.makeConstraints { make -> Void in
            make.top.equalTo(profileImageView.snp.bottom).offset(self.frame.height * 0.0149925)
            make.left.equalTo(profileImageView.snp.left).offset(12)
        }

        alcolMainTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(nickName.snp.bottom).offset(self.frame.height * 0.00449775)
            make.left.equalTo(nickName.snp.left).offset(0)
        }

        alcolRegistrationButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolMainTitle.snp.bottom).offset(self.frame.height * 0.034482)
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
            make.top.equalTo(encyclopediaButton.snp.bottom).offset(self.frame.height * 0.006)
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

        self.alcolMainTitle.text = UserViewModel.shared.userInfo?.myStatusWord!
    }

    override func setupTapped() {
        super.setupTapped()

        settingTitle.addTarget(self, action: #selector(settingTapped), for: .touchUpInside)
        alcolRegistrationButton.addTarget(self, action: #selector(alcolRegiterTapped), for: .touchUpInside)
        calendarButton.addTarget(self, action: #selector(calendarTapped), for: .touchUpInside)
        encyclopediaButton.addTarget(self, action: #selector(encyclopediaTapped), for: .touchUpInside)
    }

    public func bind(userInfo: UserInfo?) {

        guard let userInfo = userInfo, let profileUrl = userInfo.imageUrl else {
            return
        }

        self.profileImageView.kf.setImage(with: profileUrl)

        if let cardModels = userInfo.cardModel {
            if cardModels.count != 1 {
                self.pageCount.isHidden = false
                self.pageCount.numberOfPages = cardModels.count
            }
        }
        
    }
}

extension YellowCardMianView {

    @objc
    private func settingTapped() {
        delegate?.settingTapped()
    }

    @objc
    private func alcolRegiterTapped() {
        delegate?.alcolRegisterTapped()
    }

    @objc
    private func calendarTapped() {
        delegate?.calendarTapped()
    }

    @objc
    private func encyclopediaTapped() {
        delegate?.encyclopediaTapped()
    }
}
