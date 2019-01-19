//
//  MyCardSettingCell.swift
//  yellowCard
//
//  Created by 여정승 on 13/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import UIKit

protocol MyCardSettingCelldelegate {
    func mainCardTapped()
    func cardManagerTapped()
}

class MyCardSettingCell: RootCollectionViewCell {

    static let registerId = "MyCardSettingCell"

    public var delegate: MyCardSettingCelldelegate?

    private var isMainCard: Bool = true {
        didSet {
            mainCardViewSetting()
        }
    }

    private let mainCardRegisterBtn = UIButton(frame: .zero).then {
        $0.setTitle("메인 카드 등록하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    @objc private let mainCardRegisterLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCardYellow
    }

    private let careManagerBtn = UIButton(frame: .zero).then {
        $0.setTitle("카드관리하기", for: .normal)
        $0.setTitleColor(UIColor(r: 221, g: 221, b: 221), for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let careManagerLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCardYellow
        $0.isHidden = true
    }

    public let mainCardView = MainCardView()

    private let mainCardManagerView = MainCardManagerView().then {
        $0.isHidden = true
    }

    override func setup() {
        super.setup()

        addSubviews(mainCardRegisterLine,
                    mainCardRegisterBtn,
                    careManagerLine,
                    careManagerBtn,
                    mainCardView,
                    mainCardManagerView)
    }

    override func setupUI() {
        super.setupUI()

        mainCardRegisterBtn.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(49)
        }

        mainCardRegisterLine.snp.makeConstraints { make -> Void in
            make.height.equalTo(6)
            make.top.equalTo(mainCardRegisterBtn.snp.centerY).offset(3)
            make.left.equalTo(mainCardRegisterBtn.snp.left).offset(-10)
            make.right.equalTo(mainCardRegisterBtn.snp.right).offset(10)
        }

        careManagerBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(mainCardRegisterBtn.snp.top).offset(0)
            make.right.equalToSuperview().offset(-69)
        }

        careManagerLine.snp.makeConstraints { make -> Void in
            make.height.equalTo(6)
            make.top.equalTo(careManagerBtn.snp.centerY).offset(3)
            make.left.equalTo(careManagerBtn.snp.left).offset(-10)
            make.right.equalTo(careManagerBtn.snp.right).offset(10)
        }

        mainCardView.snp.makeConstraints { make -> Void in
            make.top.equalTo(mainCardRegisterBtn.snp.bottom).offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }

        mainCardManagerView.snp.makeConstraints { make -> Void in
            make.top.equalTo(mainCardRegisterBtn.snp.bottom).offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
    }

    override func setupTapped() {
        super.setupTapped()

        mainCardRegisterBtn.addTarget(self, action: #selector(mainCardRegisterBtnTapped), for: .touchUpInside)
        let registerTap = UITapGestureRecognizer(target: self, action: #selector(mainCardRegisterBtnTapped))
        mainCardRegisterLine.isUserInteractionEnabled = true
        mainCardRegisterLine.addGestureRecognizer(registerTap)

        careManagerBtn.addTarget(self, action: #selector(careManagerBtnTapped), for: .touchUpInside)
        let careManagerTap = UITapGestureRecognizer(target: self, action: #selector(careManagerBtnTapped))
        careManagerLine.isUserInteractionEnabled = true
        careManagerLine.addGestureRecognizer(careManagerTap)

    }
}

extension MyCardSettingCell {
    @objc
    private func mainCardRegisterBtnTapped() {
        isMainCard = true
        delegate?.mainCardTapped()
    }

    @objc
    private func careManagerBtnTapped() {
        isMainCard = false
        delegate?.cardManagerTapped()
    }

    private func mainCardViewSetting() {
        mainCardView.isHidden = !isMainCard
        mainCardRegisterLine.isHidden = !isMainCard
        mainCardManagerView.isHidden = isMainCard
        careManagerLine.isHidden = isMainCard

        if isMainCard {
            mainCardRegisterBtn.setTitleColor(.black, for: .normal)
            careManagerBtn.setTitleColor(UIColor(r: 221, g: 221, b: 221), for: .normal)
        } else {
            careManagerBtn.setTitleColor(.black, for: .normal)
            mainCardRegisterBtn.setTitleColor(UIColor(r: 221, g: 221, b: 221), for: .normal)
        }
    }
}
