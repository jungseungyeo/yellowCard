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

    private let cardDetailTitle = UILabel(frame: .zero).then {
        $0.text = "주량라벨은 엘로카드만의 기준에 맞추어 보여집니다."
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let selectedAlcolTitle = UILabel(frame: .zero).then {
        $0.text = "#주종을 먼저 고르세요."
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.backgroundColor = UIColor.YellowCardYellow
    }

    private let beerButton = UIButton(type: .system).then {
        $0.setTitle("맥주", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.borderWidth = 1
    }

    private let sojuButton = UIButton(type: .system).then {
        $0.setTitle("소주", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.borderWidth = 1
    }

    private let wineButton = UIButton(type: .system).then {
        $0.setTitle("와인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.borderWidth = 1
    }

    private let makgeolliButton = UIButton(type: .system).then {
        $0.setTitle("막걸리", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.borderWidth = 1
    }

    private let alcoleLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCardBlack2
    }

    private let drinkingTitle = UILabel(frame: .zero).then {
        $0.text = "#주량을 선택하세요."
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.backgroundColor = UIColor.YellowCardYellow
    }

    public var alcolDringCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
    }()

    private let registerButton = UIButton(type: .system).then {
        $0.setTitle("등록완료", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor.black
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.layer.cornerRadius = 24
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.borderWidth = 1

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
                    cardTitle,
                    cardDetailTitle,
                    selectedAlcolTitle,
                    beerButton,
                    sojuButton,
                    wineButton,
                    makgeolliButton,
                    alcoleLine,
                    drinkingTitle,
                    alcolDringCollectionView,
                    registerButton
        )
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
            make.top.equalTo(line.snp.bottom).offset(30)
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

        cardDetailTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(cardTitle.snp.bottom).offset(6)
            make.left.equalTo(cardTitle.snp.left).offset(0)
            make.right.equalToSuperview().offset(-30)
        }

        selectedAlcolTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(cardDetailTitle.snp.bottom).offset(68)
            make.left.equalTo(cardDetailTitle.snp.left).offset(0)
        }

        beerButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(selectedAlcolTitle.snp.bottom).offset(17)
            make.left.equalTo(selectedAlcolTitle.snp.left).offset(0)
            make.width.equalTo(70)
            make.height.equalTo(28)
        }

        sojuButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(selectedAlcolTitle.snp.bottom).offset(17)
            make.left.equalTo(beerButton.snp.right).offset(10)
            make.size.equalTo(beerButton.snp.size).offset(0)
        }

        wineButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(selectedAlcolTitle.snp.bottom).offset(17)
            make.left.equalTo(sojuButton.snp.right).offset(10)
            make.size.equalTo(beerButton.snp.size).offset(0)
        }

        makgeolliButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(selectedAlcolTitle.snp.bottom).offset(17)
            make.left.equalTo(wineButton.snp.right).offset(10)
            make.size.equalTo(beerButton.snp.size).offset(0)
            make.right.equalToSuperview().offset(-30)
        }

        alcoleLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(beerButton.snp.bottom).offset(16)
            make.left.equalTo(beerButton.snp.left).offset(0)
            make.right.equalTo(makgeolliButton.snp.right).offset(0)
            make.height.equalTo(2)
        }

        drinkingTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcoleLine.snp.bottom).offset(27)
            make.left.equalTo(selectedAlcolTitle.snp.left).offset(0)
        }

        alcolDringCollectionView.snp.makeConstraints { make -> Void in
            make.top.equalTo(drinkingTitle.snp.bottom).offset(17)
            make.left.equalTo(drinkingTitle.snp.left).offset(0)
            make.right.equalTo(makgeolliButton.snp.right).offset(0)
            make.height.equalTo(64)
        }

        registerButton.snp.makeConstraints { make -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(alcolDringCollectionView.snp.bottom).offset(47)
            make.height.equalTo(48)
            make.width.equalTo(128)
            make.bottom.equalTo(-37)
        }

        profileImage.kf.setImage(with: UserViewModel.shared.userInfo?.imageUrl!)
        myName.text = UserViewModel.shared.userInfo?.name!
        myAlcolStaeWord.text = UserViewModel.shared.userInfo?.myStatusWord!

        alcolDringCollectionView.register(AlcolDringCollectionViewCell.self, forCellWithReuseIdentifier: AlcolDringCollectionViewCell.registerId)
        alcolDringCollectionView.delegate = self
        alcolDringCollectionView.dataSource = self
    }

}

extension MyProfileUpdateCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlcolDringCollectionViewCell.registerId, for: indexPath) as! AlcolDringCollectionViewCell
        cell.dringAlcolButton.setTitle("\(indexPath.row)", for: .normal)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: makgeolliButton.frame.width, height: 28)
    }
}
