//
//  AlcolRegisterView.swift
//  yellowCard
//
//  Created by 여정승 on 24/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

protocol AlcolRegisterViewDelegate {
    func datePickerStop(datePicker: UIDatePicker)
    func minusTapped(numberOfPeple: String?)
    func plusTapped(numberOfPele: String?)
}

class AlcolRegisterView: RootView {

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

    public let selectedWhereTitle = UITextField(frame: .zero).then {
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

    public let selectedPepleNumber = UILabel(frame: .zero).then {
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

    private let selectAlcolTableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .black
    }

    public let registerButton = UIButton(frame: .zero).then {
        $0.setTitle("등록하기", for: .normal)
        $0.setTitleColor( .white, for: .normal)
        $0.backgroundColor = UIColor.YellowLineGray
        $0.layer.cornerRadius = 24
        $0.isEnabled = false
    }

    public let selectorAlcol = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = UIColor.black
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
                    whereLine,
                    whoTitle,
                    minusButton,
                    selectedPepleNumber,
                    plusButton,
                    numberOfPepleUint,
                    whotitleLine,
                    howDrinkingTitle,
                    registerButton,
                    selectorAlcol)
    }

    override func setupUI() {
        super.setupUI()

        title.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(14)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-61)
        }
        //SE 30 max 61
        whereTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(title.snp.bottom).offset(30)
            make.left.equalTo(title.snp.left).offset(0)
        }

        selectedWhereTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whereTitle.snp.bottom).offset(0)
            make.left.equalTo(whereTitle.snp.left).offset(0)
            make.width.equalTo(150)
        }

        whereLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(selectedWhereTitle.snp.bottom).offset(0)
            make.left.equalTo(selectedWhereTitle.snp.left).offset(0)
            make.right.equalTo(selectedWhereTitle.snp.right).offset(0)
            make.height.equalTo(1)
        }
        //se 30 max 49
        whoTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whereLine.snp.bottom).offset(30)
            make.left.equalTo(title.snp.left).offset(0)
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
        //se 30 max47
        howDrinkingTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whotitleLine.snp.bottom).offset(30)
            make.left.equalTo(whotitleLine.snp.left).offset(0)
        }

        registerButton.snp.makeConstraints { make -> Void in
            make.height.equalTo(48)
            make.width.equalTo(128)
            make.centerX.equalToSuperview().offset(0)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-31)
        }

        selectorAlcol.snp.makeConstraints { make -> Void in
            make.top.equalTo(howDrinkingTitle.snp.bottom).offset(0)
            make.left.equalTo(howDrinkingTitle.snp.left).offset(0)
            make.right.equalToSuperview().offset(-41)
            make.bottom.equalTo(registerButton.snp.top).offset(-37)
        }

//        selectorAlcol.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
//        selectorAlcol.dataSource = self
//        selectorAlcol.delegate = self
        setupKeyboard()
    }

    override func setupTapped() {
        super.setupTapped()

        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        self.datePickerView.addTarget(self, action: #selector(datePicker(datePicker:)), for: .valueChanged)
        datePickerView.locale = NSLocale(localeIdentifier: "ko-KR") as Locale
        datePickerView.datePickerMode = .date
        selectedWhereTitle.inputView = datePickerView

    }

    private func setupKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.selectedWhereTitle.inputAccessoryView = keyboardToolbar
    }
}

extension AlcolRegisterView {

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

    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
