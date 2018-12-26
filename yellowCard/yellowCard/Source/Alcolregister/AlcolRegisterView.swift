//
//  AlcolRegisterView.swift
//  yellowCard
//
//  Created by 여정승 on 24/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

protocol AlcolRegisterViewDelegate {
    func selectedWhereTitleTapped(sender: UITapGestureRecognizer)
    func datePickerStop(datePicker: UIDatePicker)
    func minusTapped(numberOfPeple: String?)
    func plusTapped(numberOfPele: String?)
}

class AlcolRegisterView: RootScrollView {

    var alcolDelegate: AlcolRegisterViewDelegate?

    private let title = UILabel(frame: .zero).then {
        $0.text = "즐거운 술자리를 가졌나요?\n스템에 맞게 입력해 주시면 기록 볼 수 있어요!"
        $0.textColor = UIColor.YellowCardBlack
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
    }

    private let whereTitle = UILabel(frame: .zero).then {
        $0.text = "언제 마셨나요?"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let selectedWhereTitle = UILabel(frame: .zero).then {
        $0.text = "2018년 12월 24일"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    public let datePickerView = UIDatePicker(frame: .zero)

    private let whereLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCardBorderColor
    }

    private let whoTitle = UILabel(frame: .zero).then {
        $0.text = "누구와 마셨나요?"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let minusButton = UIButton(frame: .zero).then {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(UIColor.YellowCardBlack, for: .normal)
        $0.backgroundColor = UIColor.YellowCardGray
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }

    private let selectedPepleNumber = UILabel(frame: .zero).then {
        $0.text = "1"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let plusButton = UIButton(frame: .zero).then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(UIColor.YellowCardBorderColor, for: .normal)
        $0.backgroundColor = UIColor.YellowCardGray
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }

    private let numberOfPepleUint = UILabel(frame: .zero).then {
        $0.text = "명"
        $0.textColor = UIColor.YellowCardBlack
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let whotitleLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowLineGray
    }

    private let howDrinkingTitle = UILabel(frame: .zero).then {
        $0.text = "어떤 술을 얼마나 먹었나요?"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let alcolSelectTitle = UILabel(frame: .zero).then {
        $0.text = "주종을 고르세요."
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
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
                    whereTitle,
                    selectedWhereTitle,
                    datePickerView,
                    whereLine,
                    whoTitle,
                    minusButton,
                    selectedPepleNumber,
                    plusButton,
                    numberOfPepleUint,
                    whotitleLine,
                    howDrinkingTitle,
                    alcolSelectTitle)
    }

    override func setupUI() {
        super.setupUI()

        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(14)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-61)
        }

        whereTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(61)
            make.left.equalTo(title.snp.left).offset(0)
        }

        selectedWhereTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whereTitle.snp.bottom).offset(0)
            make.left.equalTo(whereTitle.snp.left).offset(0)
            make.height.equalTo(46)
            make.width.equalTo(150)
        }

        whereLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(selectedWhereTitle.snp.bottom).offset(0)
            make.left.equalTo(selectedWhereTitle.snp.left).offset(0)
            make.right.equalTo(selectedWhereTitle.snp.right).offset(0)
            make.height.equalTo(1)
        }

        whoTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whereLine.snp.bottom).offset(49)
            make.left.equalTo(title.snp.left).offset(0)
            make.height.equalTo(20)
        }

        minusButton.snp.makeConstraints { make -> Void in
            make.left.equalTo(whoTitle.snp.left).offset(20)
            make.top.equalTo(whoTitle.snp.bottom).offset(20)
            make.size.equalTo(14)
        }

        selectedPepleNumber.snp.makeConstraints { make -> Void in
            make.left.equalTo(minusButton.snp.right).offset(17)
            make.centerY.equalTo(minusButton.snp.centerY).offset(0)
        }

        plusButton.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(minusButton.snp.centerY).offset(0)
            make.left.equalTo(selectedPepleNumber.snp.right).offset(14)
            make.size.equalTo(14)
        }

        numberOfPepleUint.snp.makeConstraints { make -> Void in
            make.left.equalTo(plusButton.snp.right).offset(18)
            make.centerY.equalTo(selectedPepleNumber.snp.centerY).offset(0)
        }

        whotitleLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(selectedPepleNumber.snp.bottom).offset(11)
            make.left.equalTo(whereLine.snp.left).offset(0)
            make.right.equalTo(whereLine.snp.right).offset(0)
            make.height.equalTo(1)
        }

        howDrinkingTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whotitleLine.snp.bottom).offset(47)
            make.left.equalTo(whotitleLine.snp.left).offset(0)
        }

        alcolSelectTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(howDrinkingTitle.snp.bottom).offset(23)
            make.centerX.equalTo(selectedWhereTitle.snp.centerX).offset(0)
        }

        datePickerView.snp.makeConstraints { make -> Void in
            make.height.equalTo(40)
            make.top.equalTo(self.snp.bottom)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }

    override func setupTapped() {
        super.setupTapped()

        let selectedWhereTitelTapped = UITapGestureRecognizer(target: self, action: #selector(selectedWhereTitleTapped))
        selectedWhereTitle.isUserInteractionEnabled = true
        selectedWhereTitle.addGestureRecognizer(selectedWhereTitelTapped)

        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        self.datePickerView.addTarget(self, action: #selector(datePicker(datePicker:)), for: .valueChanged)
    }
}

extension AlcolRegisterView {

    @objc
    private func selectedWhereTitleTapped(sender: UITapGestureRecognizer) {
        alcolDelegate?.selectedWhereTitleTapped(sender: sender)
    }

    @objc
    private func datePicker(datePicker: UIDatePicker) {
        alcolDelegate?.datePickerStop(datePicker: datePicker)
    }

    @objc
    private func minusTapped() {
        alcolDelegate?.minusTapped(numberOfPeple: self.selectedPepleNumber.text)
    }

    @objc
    private func plusTapped() {
        alcolDelegate?.plusTapped(numberOfPele: self.selectedPepleNumber.text)
    }
}
