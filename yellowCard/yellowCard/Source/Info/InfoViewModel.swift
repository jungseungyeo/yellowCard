//
//  InfoViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 06/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import Foundation
import ObjectMapper

class InfoViewModel {

    typealias success = () -> Void
    typealias failure = (Error?) -> Void

    public func requestMain(view: InfoViewController, token: String, success: @escaping success, failure: @escaping failure) {
        view.indicator?.startAnimating()
        YellowCardService.shared.makeHeaders(token: token)
        YellowCardService.shared.get(urlPath: .main, handler: { json in
            view.indicator?.stopAnimating()
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
        }, errorHandler: { error in
            view.indicator?.stopAnimating()
            failure(error)
        })
    }
}
