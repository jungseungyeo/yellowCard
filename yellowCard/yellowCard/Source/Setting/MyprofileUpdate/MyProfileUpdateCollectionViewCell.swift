//
//  MyProfileUpdateCollectionViewCell.swift
//  yellowCard
//
//  Created by 여정승 on 28/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

protocol MyProfileUpdateCollectionViewCellDelegate {
    func beerTap()
    func sojuTap()
    func wineTap()
    func makgeolliTap()
    func completeBtnTap(stateText: String?)
}

class MyProfileUpdateCollectionViewCell: RootCollectionViewCell {

    static let registerId = "MyProfileUpdateCollectionViewCell"

    public var delegate: MyProfileUpdateCollectionViewCellDelegate?

    public var isBeerTap = false {
        didSet {
            self.animation(btn: beerLabelBtn, image: beerPlusWithCancelBtn, flag: !isBeerTap, flagNumber: 1)
        }
    }

    public var isSojuTap = false {
        didSet {
            self.animation(btn: sojuLableBtn, image: sojuPlusWithCancelBtn, flag: !isSojuTap, flagNumber: 2)
        }
    }

    public var isWineTap = false {
        didSet {
            self.animation(btn: wineLabelBtn, image: winePlusWithCancelBtn, flag: !isWineTap, flagNumber: 3)
        }
    }

    public var isMakgeolliTap = false {
        didSet {
            self.animation(btn: makgeolliLabelBtn, image: makgeolliPlusWithCancelBtn, flag: !isMakgeolliTap, flagNumber: 4)
        }
    }

    private let profileView = UIImageView(frame: .zero).then {
        $0.layer.cornerRadius = 60
        $0.backgroundColor = .gray
        $0.clipsToBounds = true
    }

    private let nickName = UILabel(frame: .zero).then {
        $0.text = "linsaeng"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 18, weight: .Regular)
        $0.numberOfLines = 0
    }

    private let nickNameLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor(r: 238, g: 238, b: 238)
    }

    private let sectionLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor(r: 238, g: 238, b: 238)
    }

    private let alcolSateWord = UITextField(frame: .zero).then {
        $0.text = "음주 상태말"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let completeBtn = UIButton(type: .system)

    private let stateInputText = UITextField(frame: .zero).then {
        $0.placeholder = "상태메시지를 입력해 주세요."
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.keyboardType = .default
    }

    private let stateLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor(r: 238, g: 238, b: 238)
    }

    private let alcolLabelTitle = UILabel(frame: .zero).then {
        $0.text = "라벨 지정"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let alcollableDetail = UILabel(frame: .zero).then {
        $0.text = "주량라벨은 엘로카드만의 기준에 맞추어 보여집니다.\n최소 하나의 라벨을 지정해주세요 :)"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 12, weight: .Regular)
        $0.numberOfLines = 0
    }

    private let beerLabel = UILabel(frame: .zero).then {
        $0.text = "Beer"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let beerLevelTitle = UILabel(frame: .zero).then {
        $0.text = "3.0"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let beerPlusWithCancelBtn = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "roundClear24Px")
    }

    private let beerLabelBtn = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 28
        $0.layer.borderWidth = 0.1
        $0.layer.borderColor = UIColor.black.cgColor
    }

    private let sojuLabel = UILabel(frame: .zero).then {
        $0.text = "Soju"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let sojuLebelTitle = UILabel(frame: .zero).then {
        $0.text = "3.0"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    public let sojuPlusWithCancelBtn = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "roundClear24Px")
    }

    private let sojuLableBtn = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 28
        $0.layer.borderWidth = 0.1
        $0.layer.borderColor = UIColor.black.cgColor
    }

    private let wineLabel = UILabel(frame: .zero).then {
        $0.text = "Wine"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let wineLebelTitle = UILabel(frame: .zero).then {
        $0.text = "3.0"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    public let winePlusWithCancelBtn = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "roundClear24Px")
    }

    private let wineLabelBtn = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 28
        $0.layer.borderWidth = 0.1
        $0.layer.borderColor = UIColor.black.cgColor
    }

    private let makgeolliLabel = UILabel(frame: .zero).then {
        $0.text = "makgeolli"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let makgeolliLebelTitle = UILabel(frame: .zero).then {
        $0.text = "3.0"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let makgeolliPlusWithCancelBtn = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "roundClear24Px")
    }

    private let makgeolliLabelBtn = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 28
        $0.layer.borderWidth = 0.1
        $0.layer.borderColor = UIColor.black.cgColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setup() {
        super.setup()

        addSubviews(
            profileView,
            nickName,
            nickNameLine,
            sectionLine,
            alcolSateWord,
            completeBtn,
            stateInputText,
            stateLine,
            alcolLabelTitle,
            alcollableDetail,
            beerLabelBtn,
            sojuLableBtn,
            wineLabelBtn,
            makgeolliLabelBtn
        )

        beerLabelBtn.addSubviews(beerLabel,
                                 beerLevelTitle,
                                 beerPlusWithCancelBtn)

        sojuLableBtn.addSubviews(sojuLabel,
                                 sojuLebelTitle,
                                 sojuPlusWithCancelBtn)

        wineLabelBtn.addSubviews(wineLabel,
                                 wineLebelTitle,
                                 winePlusWithCancelBtn)

        makgeolliLabelBtn.addSubviews(makgeolliLabel,
                                      makgeolliLebelTitle,
                                      makgeolliPlusWithCancelBtn)
    }

    override func setupUI() {
        super.setupUI()

        profileView.snp.makeConstraints { make -> Void in
            make.top.equalTo(10)
            make.centerX.equalToSuperview().offset(0)
            make.size.equalTo(120)
        }

        nickName.snp.makeConstraints { make -> Void in
            make.top.equalTo(profileView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }

        nickNameLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(nickName.snp.bottom).offset(0)
            make.left.equalTo(nickName.snp.left).offset(-6)
            make.right.equalTo(nickName.snp.right).offset(6)
            make.height.equalTo(2)
        }

        sectionLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(nickNameLine.snp.bottom).offset(23)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(10)
        }

        alcolSateWord.snp.makeConstraints { make -> Void in
            make.top.equalTo(sectionLine.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(28)
        }

        completeBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolSateWord.snp.bottom).offset(9)
            make.right.equalToSuperview().offset(-34)
            make.width.equalTo(26)
            make.height.equalTo(20)
        }

        stateInputText.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolSateWord.snp.bottom).offset(9)
            make.left.equalTo(alcolSateWord.snp.left).offset(0)
            make.right.equalTo(completeBtn.snp.left).offset(-10)
            make.height.equalTo(completeBtn.snp.height).offset(0)
        }

        stateLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(stateInputText.snp.bottom).offset(7)
            make.left.equalTo(stateInputText.snp.left).offset(0)
            make.right.equalTo(completeBtn.snp.right).offset(0)
            make.height.equalTo(2)
        }

        alcolLabelTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(stateLine.snp.bottom).offset(30)
            make.left.equalTo(alcolSateWord.snp.left).offset(0)
        }

        alcollableDetail.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolLabelTitle.snp.bottom).offset(7)
            make.left.equalTo(alcolLabelTitle.snp.left).offset(0)
        }

        beerLabelBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcollableDetail.snp.bottom).offset(28)
            make.right.equalTo(self.snp.centerX).offset(-7)
            make.height.equalTo(56)
            make.width.equalTo(120)
        }

        beerLabel.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(22)
        }

        beerLevelTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(beerLabel.snp.bottom).offset(0)
            make.left.equalTo(beerLabel.snp.left).offset(0)
        }

        beerPlusWithCancelBtn.snp.makeConstraints { make -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-14)
        }

        sojuLableBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(beerLabelBtn.snp.top).offset(0)
            make.left.equalTo(self.snp.centerX).offset(7)
            make.height.equalTo(56)
            make.width.equalTo(120)
        }

        sojuLabel.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(22)
        }

        sojuLebelTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(sojuLabel.snp.bottom).offset(0)
            make.left.equalTo(sojuLabel.snp.left).offset(0)
        }

        sojuPlusWithCancelBtn.snp.makeConstraints { make -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-14)
        }

        wineLabelBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(beerLabelBtn.snp.bottom).offset(16)
            make.left.equalTo(beerLabelBtn.snp.left).offset(0)
            make.height.equalTo(56)
            make.width.equalTo(120)
        }

        wineLabel.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(22)
        }

        wineLebelTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(wineLabel.snp.bottom).offset(0)
            make.left.equalTo(wineLabel.snp.left).offset(0)
        }

        winePlusWithCancelBtn.snp.makeConstraints { make -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-14)
        }

        makgeolliLabelBtn.snp.makeConstraints { make -> Void in
            make.top.equalTo(sojuLableBtn.snp.bottom).offset(16)
            make.left.equalTo(self.snp.centerX).offset(7)
            make.height.equalTo(56)
            make.width.equalTo(120)
        }

        makgeolliLabel.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(22)
        }

        makgeolliLebelTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(makgeolliLabel.snp.bottom).offset(0)
            make.left.equalTo(makgeolliLabel.snp.left).offset(0)
        }

       makgeolliPlusWithCancelBtn.snp.makeConstraints { make -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-14)
        }
        
        completeBtn.setTitle("완료", for: .normal)
        completeBtn.setTitleColor(.gray, for: .normal)
        completeBtn.addTarget(self, action: #selector(completeBtnTap), for: .touchUpInside)

        profileView.kf.setImage(with: UserViewModel.shared.userInfo?.imageUrl!)
        nickName.text = UserViewModel.shared.userInfo?.name
        stateInputText.text = UserViewModel.shared.mainModel?.status_message
    }

    override func setupTapped() {
        super.setupTapped()

        setupBeerTap()
        setupSojuTap()
        setupWineTap()
        setupMakgeolliTap()

    }

    private func setupBeerTap() {
        let beerTap = UITapGestureRecognizer(target: self, action: #selector(beerBtnTapped))
        self.beerLabelBtn.addTarget(self, action: #selector(beerBtnTapped), for: .touchUpInside)

        self.beerLabel.isUserInteractionEnabled = true
        self.beerLabel.addGestureRecognizer(beerTap)

        self.beerLevelTitle.isUserInteractionEnabled = true
        self.beerLevelTitle.addGestureRecognizer(beerTap)

        self.beerPlusWithCancelBtn.isUserInteractionEnabled = true
        self.beerPlusWithCancelBtn.addGestureRecognizer(beerTap)
    }

    private func setupSojuTap() {
        let sojuTap = UITapGestureRecognizer(target: self, action: #selector(sojuBtnTapped))
        self.sojuLableBtn.addTarget(self, action: #selector(sojuBtnTapped), for: .touchUpInside)

        self.sojuLabel.isUserInteractionEnabled = true
        self.sojuLabel.addGestureRecognizer(sojuTap)

        self.sojuLebelTitle.isUserInteractionEnabled = true
        self.sojuLebelTitle.addGestureRecognizer(sojuTap)

        self.sojuPlusWithCancelBtn.isUserInteractionEnabled = true
        self.sojuPlusWithCancelBtn.addGestureRecognizer(sojuTap)
    }

    private func setupWineTap() {
        let wineTap = UITapGestureRecognizer(target: self, action: #selector(wineBtnTapped))
        self.wineLabelBtn.addTarget(self, action: #selector(wineBtnTapped), for: .touchUpInside)

        self.wineLabel.isUserInteractionEnabled = true
        self.wineLabel.addGestureRecognizer(wineTap)

        self.wineLebelTitle.isUserInteractionEnabled = true
        self.wineLebelTitle.addGestureRecognizer(wineTap)

        self.winePlusWithCancelBtn.isUserInteractionEnabled = true
        self.winePlusWithCancelBtn.addGestureRecognizer(wineTap)
    }

    private func setupMakgeolliTap() {
        let makgeolliTap = UITapGestureRecognizer(target: self, action: #selector(makgeolliTapped))
        self.makgeolliLabelBtn.addTarget(self, action: #selector(makgeolliTapped), for: .touchUpInside)

        self.makgeolliLabel.isUserInteractionEnabled = true
        self.makgeolliLabel.addGestureRecognizer(makgeolliTap)

        self.makgeolliLebelTitle.isUserInteractionEnabled = true
        self.makgeolliLebelTitle.addGestureRecognizer(makgeolliTap)

        self.makgeolliPlusWithCancelBtn.isUserInteractionEnabled = true
        self.makgeolliPlusWithCancelBtn.addGestureRecognizer(makgeolliTap)
    }
}

extension MyProfileUpdateCollectionViewCell {

    @objc
    private func beerBtnTapped() {
        if isBeerTap {
            isBeerTap = false
        } else {
            isBeerTap = true
        }
        delegate?.beerTap()
    }

    @objc
    private func sojuBtnTapped() {
        if isSojuTap {
            isSojuTap = false
        } else {
            isSojuTap = true
        }
        delegate?.sojuTap()
    }

    @objc
    private func wineBtnTapped() {
        if isWineTap {
            isWineTap = false
        } else {
            isWineTap = true
        }
        delegate?.wineTap()
    }

    @objc
    private func makgeolliTapped() {
        if isMakgeolliTap {
            isMakgeolliTap = false
        } else {
            isMakgeolliTap = true
        }
        delegate?.makgeolliTap()
    }

    private func animation(btn: UIButton, image: UIImageView, flag: Bool, flagNumber: Int) {
        if flag {
            UIView.animate(withDuration: 0.3, animations: {
                btn.backgroundColor = UIColor.white
                btn.layer.borderColor = UIColor.black.cgColor
                image.transform = CGAffineTransform(rotationAngle: CGFloat(0))
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                switch flagNumber {
                case 1: btn.backgroundColor = UIColor.YellowCardYellow
                case 2: btn.backgroundColor = UIColor.sojuBackgroundColor
                case 3: btn.backgroundColor = UIColor.wineBackgroundColor
                case 4: btn.backgroundColor = UIColor.makgeolliBackgroundColor
                default:
                    print()
                }
                btn.layer.borderColor = UIColor.clear.cgColor
                image.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 4))
            })
        }
    }

    @objc
    private func completeBtnTap() {
        delegate?.completeBtnTap(stateText: self.stateInputText.text)
    }
}
