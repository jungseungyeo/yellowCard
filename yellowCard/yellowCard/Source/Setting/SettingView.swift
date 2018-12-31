//
//  SettingView.swift
//  yellowCard
//
//  Created by 여정승 on 28/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class SettingView: RootView {

    public var settingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func setup() {
        super.setup()

        addSubviews(settingCollectionView)
    }

    override func setupUI() {
        super.setupUI()

        settingCollectionView.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
//    public var delegate: settingDelegate?
//
//    public let versionInfo = UILabel(frame: .zero).then {
//        $0.text = "버전 정보"
//        $0.textColor = .black
//        $0.textAlignment = .center
//        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
//    }
//
//    private let versionInfoBlackground = UIView(frame: .zero).then {
//        $0.backgroundColor = UIColor.YellowCardYellow
//    }
//
//    private let curruntVesion = UILabel(frame: .zero).then {
//        $0.text = "현재 버전 1.0.0"
//        $0.textColor = UIColor.black
//        $0.font = .spoqaFont(ofSize: 18, weight: .Light)
//    }
//
//    private let yellowCardInfo = UIButton(type: .system).then {
//        $0.setTitle("Sooling & Yellow Car", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = .spoqaFont(ofSize: 18, weight: .Light)
//    }
//
//    private let agreeTitle = UIButton(type: .system).then {
//        $0.setTitle("서비스 이용약관", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = .spoqaFont(ofSize: 18, weight: .Light)
//    }
//
//    private let personalInformation = UIButton(type: .system).then {
//        $0.setTitle("개인정보취급방침", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = .spoqaFont(ofSize: 18, weight: .Light)
//    }
//
//    private let firstLine = UIView(frame: .zero).then {
//        $0.backgroundColor = UIColor.YellowLineGray2
//    }
//
//    private let myInfoTitle = UILabel(frame: .zero).then {
//        $0.text = "개인정보"
//        $0.textColor = .black
//        $0.textAlignment = .center
//        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
//    }
//
//    private let myInfoBalckGround = UIView(frame: .zero).then {
//        $0.backgroundColor = UIColor.YellowCardYellow
//    }
//
//    private let myProfileUpdateBtn = UIButton(type: .system).then {
//        $0.setTitle("메인 프로필 수정", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = .spoqaFont(ofSize: 18, weight: .Light)
//    }
//
//    private let myCardSetting = UIButton(type: .system).then {
//        $0.setTitle("메인 카드 세팅", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = .spoqaFont(ofSize: 18, weight: .Light)
//    }
//
//    private let secondLine = UIView(frame: .zero).then {
//        $0.backgroundColor = UIColor.YellowLineGray2
//    }
//
//    private let myInfoSettingTitle = UILabel(frame: .zero).then {
//        $0.text = "개인정보 및 설정"
//        $0.textColor = .black
//        $0.textAlignment = .center
//        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
//    }
//
//    private let myInfoSettingBackGround = UIView(frame: .zero).then {
//        $0.backgroundColor = UIColor.YellowCardYellow
//    }
//
//    private let logOutButton = UIButton(type: .system).then {
//        $0.setTitle("로그아웃", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = .spoqaFont(ofSize: 18, weight: .Light)
//    }
//
//    private let bottomView = UILabel(frame: .zero).then {
//        $0.backgroundColor = UIColor.YellowCardYellow
//        $0.text = "ⓒ 2018 Sooling. All Rights Reserved."
//        $0.font = .spoqaFont(ofSize: 12, weight: .Light)
//        $0.textColor = .black
//        $0.textAlignment = .center
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    public func bind(currendVersion: String) {
//        self.curruntVesion.text = String(format: "현재 버전 %@", currendVersion)
//    }
//
//    override func setupTapped() {
//        super.setupTapped()
//
//        self.myProfileUpdateBtn.addTarget(self, action: #selector(myProfileTapped), for: .touchUpInside)
//    }
//
//    override func setup() {
//        super.setup()
//
//        addSubviews(versionInfoBlackground,
//                    versionInfo,
//                    curruntVesion,
//                    yellowCardInfo,
//                    agreeTitle,
//                    personalInformation,
//                    firstLine,
//                    myInfoBalckGround,
//                    myInfoTitle,
//                    myProfileUpdateBtn,
//                    myCardSetting,
//                    secondLine,
//                    myInfoSettingBackGround,
//                    myInfoSettingTitle,
//                    logOutButton,
//                    bottomView)
//
//    }
//
//    override func setupUI() {
//        super.setupUI()
//
//        versionInfo.snp.makeConstraints { make -> Void in
//            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
//            make.left.equalToSuperview().offset(48)
//        }
//
//        versionInfoBlackground.snp.makeConstraints { make -> Void in
//            make.left.equalTo(versionInfo.snp.left).offset(-5)
//            make.right.equalTo(versionInfo.snp.right).offset(5)
//            make.top.equalTo(versionInfo.snp.centerY).offset(0)
//            make.bottom.equalTo(versionInfo.snp.bottom).offset(0)
//        }
//
//        curruntVesion.snp.makeConstraints { make -> Void in
//            make.top.equalTo(versionInfo.snp.bottom).offset(19)
//            make.left.equalTo(versionInfo.snp.left).offset(0)
//            make.height.equalTo(19)
//        }
//
//        yellowCardInfo.snp.makeConstraints { make -> Void in
//            make.top.equalTo(curruntVesion.snp.bottom).offset(17)
//            make.left.equalTo(curruntVesion.snp.left).offset(0)
//            make.height.equalTo(19)
//        }
//
//        agreeTitle.snp.makeConstraints { make -> Void in
//            make.top.equalTo(yellowCardInfo.snp.bottom).offset(17)
//            make.left.equalTo(yellowCardInfo.snp.left)
//            make.height.equalTo(19)
//        }
//
//        personalInformation.snp.makeConstraints { make -> Void in
//            make.top.equalTo(agreeTitle.snp.bottom).offset(17)
//            make.left.equalTo(agreeTitle.snp.left).offset(0)
//            make.height.equalTo(19)
//        }
//
//        firstLine.snp.makeConstraints { make -> Void in
//            make.top.equalTo(personalInformation.snp.bottom).offset(23)
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//            make.height.equalTo(10)
//        }
//
//        myInfoTitle.snp.makeConstraints { make -> Void in
//            make.top.equalTo(firstLine.snp.bottom).offset(20)
//            make.left.equalTo(versionInfo.snp.left).offset(0)
//        }
//
//        myInfoBalckGround.snp.makeConstraints { make -> Void in
//            make.left.equalTo(myInfoTitle.snp.left).offset(-5)
//            make.right.equalTo(myInfoTitle.snp.right).offset(5)
//            make.top.equalTo(myInfoTitle.snp.centerY).offset(0)
//            make.bottom.equalTo(myInfoTitle.snp.bottom).offset(0)
//        }
//
//        myProfileUpdateBtn.snp.makeConstraints { make -> Void in
//            make.top.equalTo(myInfoTitle.snp.bottom).offset(19)
//            make.left.equalTo(myInfoTitle.snp.left).offset(0)
//            make.height.equalTo(19)
//        }
//
//        myCardSetting.snp.makeConstraints { make -> Void in
//            make.top.equalTo(myProfileUpdateBtn.snp.bottom).offset(19)
//            make.left.equalTo(myProfileUpdateBtn.snp.left).offset(0)
//            make.height.equalTo(19)
//        }
//
//        secondLine.snp.makeConstraints { make -> Void in
//            make.top.equalTo(myCardSetting.snp.bottom).offset(27)
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//            make.height.equalTo(firstLine.snp.height)
//        }
//
//        myInfoSettingTitle.snp.makeConstraints { make -> Void in
//            make.top.equalTo(secondLine.snp.bottom).offset(20)
//            make.left.equalTo(versionInfo.snp.left).offset(0)
//        }
//
//        myInfoSettingBackGround.snp.makeConstraints { make -> Void in
//            make.left.equalTo(myInfoSettingTitle.snp.left).offset(-5)
//            make.right.equalTo(myInfoSettingTitle.snp.right).offset(5)
//            make.top.equalTo(myInfoSettingTitle.snp.centerY).offset(0)
//            make.bottom.equalTo(myInfoSettingTitle.snp.bottom).offset(0)
//        }
//
//        logOutButton.snp.makeConstraints { make -> Void in
//            make.top.equalTo(myInfoSettingTitle.snp.bottom).offset(20)
//            make.left.equalTo(myInfoSettingTitle.snp.left).offset(0)
//        }
//
//        bottomView.snp.makeConstraints { make -> Void in
//            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(0)
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//            make.height.equalTo(60)
//        }
//    }
//}
//
//extension SettingView {
//    @objc
//    private func myProfileTapped() {
//        delegate?.myProfileTapped()
//    }
//}
