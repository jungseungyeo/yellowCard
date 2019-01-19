//
//  alcolCollectionView.swift
//  yellowCard
//
//  Created by 여정승 on 14/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import Foundation

protocol AlcolSelectedCollectionViewCellDelegate {
    func alcolButtonTapped(alcolType: AlcolType?, view: AlcolSelectedCollectionViewCell, number: Int)
}

class AlcolSelectedCollectionViewCell: RootCollectionViewCell {

    static let registerId = "AlcolSelectedCollectionViewCell"

    var delegate: AlcolSelectedCollectionViewCellDelegate?

    public var alcolType: AlcolType?

    public let alcolButton = UIButton(type: .system).then {
        $0.setTitle("맥주", for: .normal)
        $0.setTitleColor(UIColor(r: 17, g: 17, b: 17), for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Light)
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor(r: 17, g: 17, b: 17).cgColor
        $0.layer.borderWidth = 0.1
    }

    override func setup() {
        super.setup()
        addSubviews(alcolButton)
    }

    override func setupUI() {
        super.setupUI()

        alcolButton.snp.makeConstraints { make -> Void in
            make.top.right.left.bottom.equalToSuperview().offset(0)
        }
    }

    override func setupTapped() {
        super.setupTapped()

        alcolButton.addTarget(self, action: #selector(alcolButtonTapped), for: .touchUpInside)
    }

    @objc
    private func alcolButtonTapped() {

        if alcolType?.rawValue == "맥주" {
            delegate?.alcolButtonTapped(alcolType: alcolType, view: self, number: 0)
        } else if alcolType?.rawValue == "소주" {
            delegate?.alcolButtonTapped(alcolType: alcolType, view: self, number: 1)
        } else if alcolType?.rawValue == "와인" {
            delegate?.alcolButtonTapped(alcolType: alcolType, view: self, number: 2)
        } else if alcolType?.rawValue == "막걸리" {
            delegate?.alcolButtonTapped(alcolType: alcolType, view: self, number: 3)
        } else if alcolType?.rawValue == "음료수" {
            delegate?.alcolButtonTapped(alcolType: alcolType, view: self, number: 4)
        }
    }
}
