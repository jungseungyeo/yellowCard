//
//  AlcoRegisterView.swift
//  yellowCard
//
//  Created by 여정승 on 19/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation
import Then

protocol AlcoRegisterViewDelegate {
    func dismissButtonTapped()
    func datePickerDownButtonTapped()
    func datePickerStop(datePicker: UIDatePicker)
    func yearTapped(sender: UITapGestureRecognizer)
    func monthTapped(sender: UITapGestureRecognizer)
    func dayTapped(sender: UITapGestureRecognizer)
    func numberTapped(sender: UITapGestureRecognizer)
    func whoPickerDownButtonTapped()
}

class AlcoRegisterView: UIView {

    var delegate: AlcoRegisterViewDelegate?

    private var datePickerSendDate: UIDatePicker?

    private let dismissButton = UIButton(frame: .zero).then {
        $0.setTitle("cancel", for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 30, weight: .Light)
        $0.setTitleColor(UIColor.YellowCard.black, for: .normal)
    }

    private let alcolTitle = UILabel().then {
        $0.text = "주량등록"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 20, weight: .Bold)
    }

    private let whereTitle = UILabel(frame: .zero).then {
        $0.text = "언제 마셨어?"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
        $0.backgroundColor = UIColor.YellowCard.yellow
        $0.textAlignment = .center
    }

    private let yearDropDownMenu = UIButton(frame: .zero).then {
        $0.setTitle("2018", for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.contentHorizontalAlignment = .left
        $0.setTitleColor(UIColor.YellowCard.black, for: .normal)
    }

    public let yearLabel = UILabel(frame: .zero).then {
        $0.text = "2018"
        $0.textColor = .gray
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.textAlignment = .left
    }

    public let montLabel = UILabel(frame: .zero).then {
        $0.text = "월"
        $0.textColor = .gray
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.textAlignment = .left
    }

    public let dayLabel = UILabel(frame: .zero).then {
        $0.text = "일"
        $0.textColor = .gray
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.textAlignment = .left
    }

    private let whoTitle = UILabel(frame: .zero).then {
        $0.text = "누구랑 마셨어?"
        $0.textColor = UIColor.YellowCard.black
        $0.textAlignment = .center
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
        $0.backgroundColor = UIColor.YellowCard.yellow
    }

    private let whoDetailTitle = UILabel(frame: .zero).then {
        $0.text = "몇 명의 친구와 즐거운 술자리를 가졌나요?"
        $0.textColor = UIColor.YellowCard.black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.textAlignment = .center
    }

    public let whoSelectNumber = UILabel(frame: .zero).then {
        $0.text = "선택"
        $0.textColor = .gray
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.textAlignment = .left
    }

    private let whoUnit = UILabel(frame: .zero).then {
        $0.text = "명"
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Regular)
        $0.textAlignment = .center
    }

    private let whoLine = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCard.black
    }

    public let whoPickerDownButton = UIButton(frame: .zero).then {
        $0.setTitle("가리기", for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 20, weight: .Regular)
        $0.contentHorizontalAlignment = .center
        $0.setTitleColor(UIColor.YellowCard.black, for: .normal)
    }

    private let howDrikTitle = UILabel(frame: .zero).then {
        $0.text = "얼마나 마셨어?"
        $0.textColor = UIColor.YellowCard.black
        $0.backgroundColor = UIColor.YellowCard.yellow
        $0.font = .spoqaFont(ofSize: 14, weight: .Bold)
    }

    public let datePickerDownButton = UIButton(frame: .zero).then {
        $0.setTitle("가리기", for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 20, weight: .Regular)
        $0.contentHorizontalAlignment = .center
        $0.setTitleColor(UIColor.YellowCard.black, for: .normal)
    }

    private let lineView = UIView(frame: .zero).then {
        $0.backgroundColor = UIColor.YellowCard.black
    }

    public let datePicker = UIDatePicker(frame: .zero)
    public let customWhoDatePicker = UIPickerView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {

        self.backgroundColor = .white

        addSubViews(
            dismissButton,
            alcolTitle,
            whereTitle,
            yearLabel,
            montLabel,
            dayLabel,
            lineView,
            whoTitle,
            whoSelectNumber,
            whoDetailTitle,
            whoUnit,
            whoLine,
            whoPickerDownButton,
            howDrikTitle,
            datePickerDownButton,
            datePicker,
            customWhoDatePicker)

        dismissButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            make.right.equalToSuperview().offset(-30)
        }

        alcolTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(28)
            make.left.equalToSuperview().offset(40)
        }

        whereTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(alcolTitle.snp.bottom).offset(28)
            make.left.equalTo(alcolTitle.snp.left).offset(0)
        }

        yearLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(whereTitle.snp.bottom).offset(0)
            make.left.equalTo(whereTitle.snp.left).offset(0)
            make.height.equalTo(42)
            make.width.equalTo(136)
        }

        montLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(yearLabel.snp.top).offset(0)
            make.left.equalTo(yearLabel.snp.right).offset(0)
            make.height.equalTo(yearLabel.snp.height).offset(0)
            make.width.equalTo(78)
        }

        dayLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(montLabel.snp.top).offset(0)
            make.left.equalTo(montLabel.snp.right).offset(0)
            make.height.equalTo(montLabel.snp.height).offset(0)
            make.width.equalTo(78)
        }

        lineView.snp.makeConstraints { make -> Void in
            make.top.equalTo(yearLabel.snp.bottom).offset(0)
            make.height.equalTo(1)
            make.left.equalTo(yearLabel.snp.left).offset(0)
            make.right.equalTo(dayLabel.snp.right).offset(0)
        }

        whoTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(lineView.snp.bottom).offset(49)
            make.left.equalTo(whereTitle.snp.left).offset(0)
        }

        whoDetailTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whoTitle.snp.bottom).offset(9)
            make.left.equalTo(whoTitle.snp.left).offset(0)
        }

        whoSelectNumber.snp.makeConstraints { make -> Void in
            make.top.equalTo(whoDetailTitle.snp.bottom).offset(6)
            make.left.equalTo(whoDetailTitle.snp.left).offset(0)
            make.width.equalTo(136)
            make.height.equalTo(42)
        }

        whoUnit.snp.makeConstraints { make -> Void in
            make.top.equalTo(whoSelectNumber.snp.top).offset(0)
            make.left.equalTo(whoSelectNumber.snp.right).offset(0)
            make.height.equalTo(whoSelectNumber.snp.height).offset(0)
            make.width.equalTo(46)
        }

        whoLine.snp.makeConstraints { make -> Void in
            make.top.equalTo(whoSelectNumber.snp.bottom).offset(0)
            make.left.equalTo(whoSelectNumber.snp.left).offset(0)
            make.right.equalTo(whoUnit.snp.right).offset(0)
            make.height.equalTo(1)
        }

        whoPickerDownButton.snp.makeConstraints { make -> Void in
            make.height.equalTo(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.snp.bottom).offset(0)
        }

        howDrikTitle.snp.makeConstraints { make -> Void in
            make.top.equalTo(whoLine.snp.bottom).offset(49)
            make.left.equalTo(whereTitle.snp.left).offset(0)
        }

        datePickerDownButton.snp.makeConstraints { make -> Void in
            make.height.equalTo(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.snp.bottom).offset(0)
        }

        datePicker.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.top.equalTo(datePickerDownButton.snp.bottom).offset(0)
            make.height.equalTo(300)
        }

        customWhoDatePicker.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.top.equalTo(whoPickerDownButton.snp.bottom).offset(0)
            make.height.equalTo(300)
        }

        setupTouch()
    }

    private func setupTouch() {
        self.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        self.datePicker.addTarget(self, action: #selector(datePicker(datePicker:)), for: .valueChanged)
        self.datePickerDownButton.addTarget(self, action: #selector(datePickerDownButtonTapped), for: .touchUpInside)
        self.whoPickerDownButton.addTarget(self, action: #selector(whoPickerDownButtonTapped), for: .touchUpInside)

        let tap = UITapGestureRecognizer(target: self, action: #selector(yearTapped(sender:)))
        yearLabel.isUserInteractionEnabled = true
        self.yearLabel.addGestureRecognizer(tap)
        datePicker.locale = NSLocale(localeIdentifier: "ko-KR") as Locale
        datePicker.datePickerMode = .date

        let tapped = UITapGestureRecognizer(target: self, action: #selector(monthTapped(sender:)))
        self.montLabel.isUserInteractionEnabled = true
        self.montLabel.addGestureRecognizer(tapped)

        let tappeds = UITapGestureRecognizer(target: self, action: #selector(dayTapped(sender:)))
        self.dayLabel.isUserInteractionEnabled = true
        self.dayLabel.addGestureRecognizer(tappeds)

        let numberTapped = UITapGestureRecognizer(target: self, action: #selector(numberTapped(sender:)))
        self.whoSelectNumber.isUserInteractionEnabled = true
        self.whoSelectNumber.addGestureRecognizer(numberTapped)


        let dateModelPicker = DateModelPicker()
        dateModelPicker.modelData = Date.getData()
        customWhoDatePicker.delegate = dateModelPicker
        customWhoDatePicker.dataSource = dateModelPicker
    }
}

extension AlcoRegisterView {
    @objc
    private func dismissButtonTapped() {
        delegate?.dismissButtonTapped()
    }

    @objc
    private func datePicker(datePicker: UIDatePicker) {
        delegate?.datePickerStop(datePicker: datePicker)
    }

    @objc
    private func datePickerDownButtonTapped() {
        delegate?.datePickerDownButtonTapped()
    }

    @objc
    private func yearTapped(sender: UITapGestureRecognizer) {
        delegate?.yearTapped(sender: sender)
    }

    @objc
    private func monthTapped(sender: UITapGestureRecognizer) {
        delegate?.monthTapped(sender: sender)
    }

    @objc
    private func dayTapped(sender: UITapGestureRecognizer) {
        delegate?.dayTapped(sender: sender)
    }

    @objc
    private func numberTapped(sender: UITapGestureRecognizer) {
        delegate?.numberTapped(sender: sender)
    }

    @objc
    private func whoPickerDownButtonTapped() {
        delegate?.whoPickerDownButtonTapped()
    }
}
