//
//  AlcolRegisterViewController.swift
//  yellowCard
//
//  Created by 여정승 on 24/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class AlcolRegisterViewController: RootVC {

    private var alcolView: AlcolRegisterView? = nil

    private var viewModel = AlcolRegisterViewModel()

    private var cellCount: Int = 0
    private var isBeer: Bool = false
    private var isSoju: Bool = false
    private var isWine: Bool = false
    private var isMakgeolli: Bool = false

    static func instance() -> AlcolRegisterViewController? {
        return UIStoryboard(name: "AlcolRegister", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? AlcolRegisterViewController
    }

    override func setup() {
        super.setup()
        setupNavibar()
        alcolView = AlcolRegisterView(frame: self.view.frame)
        self.view = alcolView
        alcolView?.alcolDelegate = self

        alcolView?.selectorAlcol.register(AlcolRegisterTableViewCell.self, forCellReuseIdentifier: AlcolRegisterTableViewCell.registerId)
        alcolView?.selectorAlcol.delegate = self
        alcolView?.selectorAlcol.dataSource = self
        alcolView?.selectorAlcol.isScrollEnabled = false
        alcolView?.selectorAlcol.separatorStyle = .none

        alcolView?.selectedWhereTitle.text = viewModel.currentDate()


    }

    private func setupNavibar() {

        let title = "주량 등록"
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSMutableAttributedString.Key.font: UIFont.spoqaFont(ofSize: 20, weight: .Bold)]

        let filterInitBarButton = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelBarButtonItemTapped))
        filterInitBarButton.image = UIImage(named: "backBtn.png")
        filterInitBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = filterInitBarButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        isRegisterButton()
    }

    private func isRegisterButton() {
        _ = viewModel.isRegisterButton.subscribe(onNext:{ [weak self] isValid in
            self?.alcolView?.registerButton.isEnabled = isValid
            if isValid {
                self?.alcolView?.registerButton.backgroundColor = UIColor.YellowCardYellow
                self?.alcolView?.registerButton.setTitleColor(UIColor.YellowCardBorderColor, for: .normal)
            } else {
                self?.alcolView?.registerButton.backgroundColor = UIColor.YellowLineGray
                self?.alcolView?.registerButton.setTitleColor(UIColor.white, for: .normal)
            }
        })
    }

    @objc
    private func cancelBarButtonItemTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension AlcolRegisterViewController: AlcolRegisterViewDelegate {

    func datePickerStop(datePicker: UIDatePicker) {
        let date = datePicker.date.debugDescription.split(separator: "-").map{ String($0) }
        let selectDay = "\(date.first!)년 \(date[1])월 \(date[2].split(separator: " ").map{ String($0) }.first!)일"
        self.alcolView?.selectedWhereTitle.attributedText = selectDay.attributedString(font: .spoqaFont(ofSize: 14, weight: .Bold), textColor: UIColor.YellowCardBorderColor)
    }

    func minusTapped(numberOfPeple: String?) {
        guard let number = Int(numberOfPeple!), number != 1 else {
            return
        }
        self.alcolView?.selectedPepleNumber.text = "\(number - 1)"
    }

    func plusTapped(numberOfPele: String?) {
        guard let number = Int(numberOfPele!) else {
            return
        }
        self.alcolView?.selectedPepleNumber.text = "\(number + 1)"
    }
}

extension AlcolRegisterViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.alcolView!.selectorAlcol.frame.height / 4)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlcolRegisterTableViewCell.registerId, for: indexPath) as! AlcolRegisterTableViewCell
        cell.selectionStyle = .none
        cell.alcolRegisterPickerDelegate = self
        cell.myIndexRow = cellCount
        cellCount += 1
        _ = cell.alcolTitle.rx.text.map{ $0 ?? ""}.bind(to: viewModel.selectedAlcol1)
        _ = cell.alcolTitle.rx.text.map{ $0 ?? ""}.bind(to: viewModel.selectedAlcol2)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

extension AlcolRegisterViewController: AlcolRegisterPickerDelegate {
    func selectedPicker(pickerAlcolType pickerAlcolTypeValue: pickerAlcolType, indexRow: Int, view: AlcolRegisterTableViewCell) {


        switch pickerAlcolTypeValue {
        case .cancel:
            self.changedText(pickerAlcolTypeValue: pickerAlcolType(rawValue: view.alcolTitle.text!))
            view.alcolTitle.text = "주종을 고르세요."
            view.alcolDrinkValue.text = "300"
            view.alcolUnit.text = "cc"
        case .beer:
            self.changedText(pickerAlcolTypeValue: pickerAlcolType(rawValue: view.alcolTitle.text!))
            if isBeerChecked() {
                view.alcolTitle.text = pickerAlcolTypeValue.rawValue
                view.alcolDrinkValue.text = "300"
                view.alcolUnit.text = "cc"
                break
            }
            self.navigationController?.viewControllers.last?.view.makeToast("맥주는 이미 선택되어 있습니다.")
        case .soju:
            self.changedText(pickerAlcolTypeValue: pickerAlcolType(rawValue: view.alcolTitle.text!))
            if isSojuChecked() {
                view.alcolTitle.text = pickerAlcolTypeValue.rawValue
                view.alcolDrinkValue.text = "0.5"
                view.alcolUnit.text = "병"
                break
            }
            self.navigationController?.viewControllers.last?.view.makeToast("소주는 이미 선택되어 있습니다.")
        case .wine:
            self.changedText(pickerAlcolTypeValue: pickerAlcolType(rawValue: view.alcolTitle.text!))
            if isWineChecked() {
                view.alcolTitle.text = pickerAlcolTypeValue.rawValue
                view.alcolDrinkValue.text = "1"
                view.alcolUnit.text = "잔"
                break
            }
            self.navigationController?.viewControllers.last?.view.makeToast("와인는 이미 선택되어 있습니다.")
        case .makgeolli:
            self.changedText(pickerAlcolTypeValue: pickerAlcolType(rawValue: view.alcolTitle.text!))
            if isMakgeolliChecked() {
                view.alcolTitle.text = pickerAlcolTypeValue.rawValue
                view.alcolDrinkValue.text = "0.5"
                view.alcolUnit.text = "사발"
                break
            }
            self.navigationController?.viewControllers.last?.view.makeToast("막걸리는 이미 선택되어 있습니다.")

        }
        self.view.endEditing(true)
    }

    private func isBeerChecked() -> Bool {
        if isBeer { return !isBeer }
        isBeer = true
        return isBeer
    }

    private func isSojuChecked() -> Bool {
        if isSoju { return !isSoju }
        isSoju = true
        return isSoju
    }

    private func isWineChecked() -> Bool {
        if isWine { return !isWine }
        isWine = true
        return isWine
    }

    private func isMakgeolliChecked() -> Bool {
        if isMakgeolli { return !isMakgeolli }
        isMakgeolli = true
        return isMakgeolli
    }

    private func changedText(pickerAlcolTypeValue: pickerAlcolType?) {
        guard let value = pickerAlcolTypeValue else {
            return
        }

        switch value {
        case .cancel: break
        case .beer:
            isBeer = false
        case .soju:
            isSoju = false
        case .wine:
            isWine = false
        case .makgeolli:
            isMakgeolli = false
        }
    }
}
