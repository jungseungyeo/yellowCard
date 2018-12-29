//
//  MyProfileUpdateCollectionViewCell.swift
//  yellowCard
//
//  Created by 여정승 on 28/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class MyProfileUpdateCollectionViewCell: RootCollectionViewCell {

    static let registerId = "MyProfileUpdateCollectionViewCell"

    private let profileImage = UIImageView(frame: .zero).then {
        $0.layer.cornerRadius = 60
        $0.clipsToBounds = true
    }

    private let myName = UILabel(frame: .zero).then {
        $0.text = "YellowCard"
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 18, weight: .Regular)
    }

    private let line = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowLineGray2
    }

    private let myAlcolStateTitle = UILabel(frame: .zero).then {
        $0.text = "음주 상태말"
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let myAlcolStaeWord = UITextField(frame: .zero).then {
        $0.text = ""
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
    }

    private let myAlcolRegisterLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowLineGray2
    }

    private let myAlcolRegisterButton = UIButton(type: .system).then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let cardTitle = UILabel(frame: .zero).then {
        $0.text = "음주 상태말"
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setup() {
        super.setup()

        addSubviews(profileImage,
                    myName,
                    line,
                    myAlcolStateTitle,
                    myAlcolStaeWord,
                    myAlcolRegisterButton,
                    myAlcolRegisterLine,
                    cardTitle)
    }

    override func setupUI() {
        super.setupUI()

        profileImage.snp.makeConstraints { make -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.size.equalTo(120)
        }

        myName.snp.makeConstraints { make -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImage.snp.bottom).offset(15)
        }

        line.snp.makeConstraints { make -> Void in
            make.top.equalTo(myName.snp.bottom).offset(16)
            make.width.equalToSuperview()
            make.height.equalTo(10)
        }

        myAlcolStateTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(line.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }

        myAlcolStaeWord.snp.makeConstraints { make -> Void in
            make.top.equalTo(myAlcolStateTitle.snp.bottom).offset(10)
            make.left.equalTo(myAlcolStateTitle.snp.left).offset(0)
        }

        myAlcolRegisterButton.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(myAlcolStaeWord.snp.centerY).offset(0)
            make.right.equalToSuperview().offset(-32)
        }

        myAlcolRegisterLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(myAlcolStaeWord.snp.bottom).offset(7)
            make.left.equalTo(myAlcolStaeWord.snp.left).offset(0)
            make.right.equalTo(myAlcolRegisterButton.snp.right).offset(0)
            make.height.equalTo(2)
        }

        cardTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(myAlcolRegisterLine.snp.bottom).offset(32)
            make.left.equalTo(myAlcolRegisterLine.snp.left).offset(0)
        }

        profileImage.kf.setImage(with: UserViewModel.shared.userInfo?.imageUrl!)
        myName.text = UserViewModel.shared.userInfo?.name!
        myAlcolStaeWord.text = UserViewModel.shared.userInfo?.myStatusWord!

    }

}
