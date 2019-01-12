//
//  MainModel.swift
//  yellowCard
//
//  Created by 여정승 on 06/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import ObjectMapper

class MainModel: Mappable {

    var dink_cards: [dink_cards]?

    var profile_image_url: String?
    var status_message: String?
    var user_naem: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        self.dink_cards <- map["dink_cards"]
        self.profile_image_url <- map["profile_image_url"]
        self.status_message <- map["status_message"]
        self.user_naem <- map["user_naem"]
    }
}

class dink_cards: Mappable {

    var dink_type: String?
    var message: String?

    required init?(map: Map) { }

    func mapping(map: Map) {

    }
}
