//
//  AlcolRegisterVC.swift
//  yellowCard
//
//  Created by 여정승 on 19/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

class AlcolRegisterViewController: UIViewController {

    private let alcolRegisterView = AlcoRegisterView()

    private var arrat: [DateModel] = []

    static func instance() -> AlcolRegisterViewController? {
        return UIStoryboard(name: "AlcolRegister", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? AlcolRegisterViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = alcolRegisterView
        alcolRegisterView.delegate = self

        arrat = Date.getData()
        alcolRegisterView.customWhoDatePicker.delegate = self
        alcolRegisterView.customWhoDatePicker.delegate = self
    }

}

extension AlcolRegisterViewController: AlcoRegisterViewDelegate {

    func dayTapped(sender: UITapGestureRecognizer) {
        self.alcolRegisterView.yearLabel.isUserInteractionEnabled = false
        self.alcolRegisterView.montLabel.isUserInteractionEnabled = false
        self.alcolRegisterView.dayLabel.isUserInteractionEnabled = false
        datePickerDown()
    }


    func yearTapped(sender: UITapGestureRecognizer) {
        self.isDateButton(flag: false)
        datePickerDown()
    }

    func datePickerDownButtonTapped() {
        self.isDateButton(flag: true)
        datepickerUP()
    }

    func monthTapped(sender: UITapGestureRecognizer) {
        self.isDateButton(flag: false)
        datePickerDown()
    }

    func datePickerStop(datePicker: UIDatePicker) {
        let date = datePicker.date.debugDescription.split(separator: "-").map{ String($0) }
        self.alcolRegisterView.yearLabel.text = date.first
        self.alcolRegisterView.montLabel.text = date[1]
        let day = date[2].split(separator: " ").map{ String($0) }.first
        self.alcolRegisterView.dayLabel.text = day

        self.alcolRegisterView.yearLabel.textColor = UIColor.YellowCard.black
        self.alcolRegisterView.montLabel.textColor = UIColor.YellowCard.black
        self.alcolRegisterView.dayLabel.textColor = UIColor.YellowCard.black
    }

    func numberTapped(sender: UITapGestureRecognizer) {
        isDateButton(flag: false)
        numberPickerUP()
    }

    func whoPickerDownButtonTapped() {
        isDateButton(flag: true)
        numberPickerDown()
    }

    func dismissButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AlcolRegisterViewController {
    private func datepickerUP() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alcolRegisterView.datePicker.center.y += 300
            self.alcolRegisterView.datePickerDownButton.center.y += 300
            self.view.layoutIfNeeded()
        })
    }

    private func datePickerDown() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alcolRegisterView.datePicker.center.y += -300
            self.alcolRegisterView.datePickerDownButton.center.y += -300
            self.view.layoutIfNeeded()
        })
    }

    private func numberPickerUP() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alcolRegisterView.whoPickerDownButton.center.y += -300
            self.alcolRegisterView.customWhoDatePicker.center.y += -300
            self.view.layoutIfNeeded()
        })
    }

    private func numberPickerDown() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alcolRegisterView.whoPickerDownButton.center.y += 300
            self.alcolRegisterView.customWhoDatePicker.center.y += 300
            self.view.layoutIfNeeded()
        })
    }
}

extension AlcolRegisterViewController {
    private func isDateButton(flag: Bool) {
        self.alcolRegisterView.yearLabel.isUserInteractionEnabled = flag
        self.alcolRegisterView.montLabel.isUserInteractionEnabled = flag
        self.alcolRegisterView.dayLabel.isUserInteractionEnabled = flag
        self.alcolRegisterView.whoSelectNumber.isUserInteractionEnabled = flag
    }
}

extension AlcolRegisterViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrat.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrat[row].number
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.alcolRegisterView.whoSelectNumber.text = arrat[row].number
        self.alcolRegisterView.whoSelectNumber.textColor = UIColor.YellowCard.black
    }
}
