//
//  DataModelPicker.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation
import UIKit

class Date {
    class func getData() -> [DateModel] {
        var data = [DateModel]()
        for index in 0 ... 99 {
            let number = index as NSNumber
            data.append(DateModel(number: number.stringValue))
        }
        return data
    }
}

struct DateModel {
    var number = ""

    init(number: String) {
        self.number = number
    }
}

class DateModelPicker: UIPickerView {
    var modelData: [DateModel]!
}

extension DateModelPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
}

extension DateModelPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modelData[row].number
    }
}
