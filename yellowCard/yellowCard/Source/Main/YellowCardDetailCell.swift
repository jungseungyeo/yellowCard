//
//  YellowCardDetailCell.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
//alcolType: nonalcoholic, beer, soju, wine, makgeolli
enum alcolType: String {
    case nonAlcol = "nonalcoholic"
    case beer = "beer"
    case soju = "soju"
    case wine = "wine"
    case makgeolli = "makgeolli"

    var alcolName: String {
        switch self {
        case .nonAlcol: return "무 알콜"
        case .beer: return "맥주"
        case .soju: return "소주"
        case .wine: return "와인"
        case .makgeolli: return "막걸리"
        }
    }
}

class YellowCardDetailCell: RootCollectionViewCell {

    static let registerId = "YellowCardDetailCell"

    private let title = UILabel(frame: .zero).then {
        $0.text = "내가 가장 좋아하는 %@"
        $0.font = .spoqaFont(ofSize: 20, weight: .Light)
    }

    private let mainTitle = UILabel(frame: .zero).then {
        $0.text = "%@잔까지는 깜끔하게"
        $0.font = .spoqaFont(ofSize: 20, weight: .Light)
        $0.backgroundColor = .white
    }

    private let endTitle = UILabel(frame: .zero).then {
        $0.text = "마실 수 있어요."
        $0.font = .spoqaFont(ofSize: 20, weight: .Light)
        $0.numberOfLines = 0
    }

    private let border = UIView(frame: .zero).then {
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.cornerRadius = 7
    }

    private let background = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCardYellow
    }

    private let alcolImg = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "beerCopy.png")
        $0.contentMode = .scaleAspectFill
    }

    override func setup() {
        super.setup()

        addSubviews(background
            ,border
            ,title
            ,mainTitle
            ,endTitle
            ,alcolImg)
    }

    override func setupUI() {
        super.setupUI()

        border.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-27)
            make.height.equalTo(border.snp.width).offset(0)
        }

        background.snp.makeConstraints { make -> Void in
            make.top.equalTo(border.snp.top).offset(10)
            make.left.equalTo(border.snp.left).offset(9)
            make.size.equalTo(border.snp.size).offset(0)
        }

        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(border.snp.top).offset(41)
            make.left.equalTo(border.snp.left).offset(37)
        }

        mainTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(0)
            make.left.equalTo(title.snp.left).offset(0)
        }

        endTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(mainTitle.snp.bottom).offset(0)
            make.left.equalTo(title.snp.left).offset(0)
        }

        alcolImg.snp.makeConstraints { make -> Void in
            make.width.equalTo(border.snp.width).multipliedBy(0.428125)
            make.height.equalTo(border.snp.height).multipliedBy(0.565625)
            make.right.equalTo(border.snp.right).offset(-27)
            make.bottom.equalTo(border.snp.bottom).offset(-18)
        }
    }

    public func bind(cardModel: CardModel?) {

        guard let cardModel = cardModel, let alcoltype = alcolType(rawValue: cardModel.alcolType!) else {
            setWelcome()
            return
        }

        // title
        let title = String(format: "내가 가장 좋아하는 %@", alcoltype.alcolName)
        self.title.text = title
        self.title.attributedText = title.attributedString(font: .spoqaFont(ofSize: 20, weight: .Light), textColor: UIColor.YellowCardBlack)

        self.mainTitle.text = cardModel.mainTitle ?? ""

        switch alcoltype {
        case .nonAlcol:
            print()
        case .beer:
            self.background.backgroundColor = UIColor.YellowCardYellow
        case .soju:
            self.background.backgroundColor = UIColor.sojuBackgroundColor
        case .wine:
            self.background.backgroundColor = UIColor.wineBackgroundColor
        case .makgeolli:
            self.background.backgroundColor = UIColor.makgeolliBackgroundColor
        }
    }
}

extension YellowCardDetailCell {

    private func setWelcome() {
        let firstTitle = "반가워요"
        self.title.attributedText = firstTitle.attributedString(font: .spoqaFont(ofSize: 20, weight: .Light), textColor: UIColor.YellowCardBlack)

        let mainTitle = "주량을 등록하면,"
        self.mainTitle.attributedText = mainTitle.attributedString(font: .spoqaFont(ofSize: 20, weight: .Light), textColor: UIColor.YellowCardBlack)

        let endTitle = "엘로우 카드를 즐길 수\n있어요!"
        self.endTitle.attributedText = endTitle.attributedString(font: .spoqaFont(ofSize: 20, weight: .Light), textColor: UIColor.YellowCardBlack)

        self.background.backgroundColor = UIColor.welcomeBackgroundColor

    }
}
