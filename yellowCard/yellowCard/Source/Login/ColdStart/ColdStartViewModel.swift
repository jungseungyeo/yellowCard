//
//  ColdStarViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 12/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import RxCocoa
import RxSwift
import ObjectMapper

class ColdStartViewModel {

    var isNickName = Variable<String>("")
    var isStateWord = Variable<String>("")

    var isSignIn: Observable<Bool> {
        return Observable.combineLatest(isNickName.asObservable(), isStateWord.asObservable()) { nickName, stateWord in
            nickName.count != 0 && stateWord.count != 0
        }
    }

    public func requesetSingIn(token: String, nickName: String?, stateWord: String?, success: @escaping () -> Void, failure: @escaping (Error?) -> Void) {
        guard let nickName = nickName, let stateWord = stateWord else {
            return
        }
        let param = ["access_token": token, "status_message": stateWord, "user_name": nickName]
        YellowCardService.shared.post(url: .signIn, parameters: param, handler: { json in
            UserDefaults.standard.set(json["token"].stringValue, forKey: "token")
            YellowCardService.shared.makeHeaders(token: json["token"].stringValue)
            success()
        }, errorHandler: { error in
            failure(error)
        })
    }

    public func requestMainData(success: @escaping () -> Void, failure: @escaping (Error?) -> Void) {
        YellowCardService.shared.get(urlPath: .main, handler: { json in
            print("json: \(json)")
            let profile_image_url = json["profile_image_url"].stringValue
            let status_message = json["status_message"].stringValue
            let user_name = json["user_name"].stringValue
            var drink_cards: [drink_card] = [drink_card]()
            let jsonArray = json["drink_cards"].arrayValue
            for jsonObject in jsonArray {
                drink_cards.append(Mapper<drink_card>().map(JSON: jsonObject.dictionaryObject!)!)
            }
            UserViewModel.shared.mainModel?.dink_cards = drink_cards
            UserViewModel.shared.mainModel = Mapper<MainModel>().map(JSON: ["profile_image_url":profile_image_url, "status_message": status_message, "user_name":user_name])
            success()
        }, errorHandler: { (error) in
            failure(error)
        })
    }
}
