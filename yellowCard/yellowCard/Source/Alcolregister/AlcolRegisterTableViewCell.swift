//
//  AlcolRegisterTableViewCell.swift
//  yellowCard
//
//  Created by 여정승 on 27/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

public enum pickerAlcolType: String {
    case cancel = "취소"
    case beer   = "맥주"
    case soju   = "소주"
    case wine   = "와인"
    case makgeolli = "막걸리"
}

protocol AlcolRegisterPickerDelegate {
    func selectedPicker(pickerAlcolType: pickerAlcolType, indexRow: Int, view: AlcolRegisterTableViewCell)
}

class AlcolRegisterTableViewCell: RootTableViewCell {

    static let registerId = "AlcolRegisterTableViewCell"

    private let selectedAlcoelList = ["취소", "맥주", "소주", "와인", "막걸리"]

    public var myIndexRow: Int?

    public var alcolRegisterPickerDelegate: AlcolRegisterPickerDelegate?

    public let alcolTitle = UITextField(frame: .zero).then {
        $0.text = "주종을 고르세요."
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
    }

    private let alcolRegisterAlcolPickerView = UIPickerView(frame: .zero)

    private let minusButton = UIButton(type: .system).then {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(UIColor.YellowCardBlack, for: .normal)
        $0.backgroundColor = UIColor.YellowCardGray
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }

    public let alcolDrinkValue = UILabel(frame: .zero).then {
        $0.text = "300"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let plusButton = UIButton(type: .system).then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(UIColor.YellowCardBorderColor, for: .normal)
        $0.backgroundColor = UIColor.YellowCardGray
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }

    public let alcolUnit = UILabel(frame: .zero).then {
        $0.text = "cc"
        $0.textColor = UIColor.YellowCardBorderColor
        $0.textAlignment = .left
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    private let line = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowLineGray
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setup() {
        super.setup()
        addSubviews(alcolTitle,
                    minusButton,
                    alcolDrinkValue,
                    plusButton,
                    alcolUnit,
                    line)
    }

    override func setupUI() {
        super.setupUI()

        alcolTitle.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(0)
            make.width.equalTo(110)
        }

        minusButton.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(alcolTitle.snp.centerY).offset(0)
            make.left.equalTo(alcolTitle.snp.right).offset(29)
            make.size.equalTo(14)
        }

        alcolDrinkValue.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(alcolTitle.snp.centerY).offset(0)
            make.left.equalTo(minusButton.snp.right).offset(13)
            make.width.equalTo(40)
        }

        plusButton.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(alcolTitle.snp.centerY).offset(0)
            make.left.equalTo(alcolDrinkValue.snp.right).offset(12)
            make.size.equalTo(14)
        }

        alcolUnit.snp.makeConstraints { make -> Void in
            make.left.equalTo(plusButton.snp.right).offset(14)
            make.centerY.equalTo(alcolTitle.snp.centerY).offset(0)
        }

        line.snp.makeConstraints { make -> Void in
            make.height.equalTo(1)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    override func setupTapped() {
        super.setupTapped()
        alcolRegisterAlcolPickerView.delegate = self
        alcolRegisterAlcolPickerView.dataSource = self
        alcolTitle.inputView = alcolRegisterAlcolPickerView
        setupKeyboard()
    }

    private func setupKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.alcolTitle.inputAccessoryView = keyboardToolbar
    }

}

extension AlcolRegisterTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {

    @objc func dismissKeyboard() {
        self.endEditing(true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedAlcoelList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedAlcoelList[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        alcolRegisterPickerDelegate?.selectedPicker(pickerAlcolType: pickerAlcolType(rawValue: selectedAlcoelList[row])!, indexRow: myIndexRow!, view: self)
    }
}
