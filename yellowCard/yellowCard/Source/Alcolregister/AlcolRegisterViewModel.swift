//
//  AlcolViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 28/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import RxSwift
import RxCocoa

class AlcolRegisterViewModel {

    var selectedAlcol1 = Variable<String>("")
    var selectedAlcol2 = Variable<String>("")

    var isRegisterButton: Observable<Bool> {
        return Observable.combineLatest(selectedAlcol1.asObservable(), selectedAlcol2.asObservable()) { alcol1, alcol2 in
            alcol1 != "주종을 고르세요." && alcol1 != ""
        }
    }

    func currentDate() -> String {
        let today = NSDate() //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: today as Date)
    }
}
